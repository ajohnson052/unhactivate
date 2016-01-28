class Breach < ActiveRecord::Base
  belongs_to :organization

  def notify
    org = self.organization
    users = org.users
    users.each do |user|
      UserMailer.breach_email(user, org).deliver_now
    end
  end

  def notify_by_text
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']


    client = Twilio::REST::Client.new twilio_sid, twilio_token

    # client.account.sms.messages.create(
    #   :from => twilio_phone_number,
    #   :to => 'test_phone_number',
    #   :body => 'hey, there from unhactivate.com! breach detected!'
    # )

    org = self.organization
    users = org.users
    users.each do |user|
      client.account.sms.messages.create(
        :from => twilio_phone_number,
        :to => user.phone_number,
        :body => "Unhactivate.com has detected a security breach that may affect you. Log in for details."
      )
    end

  end

end
