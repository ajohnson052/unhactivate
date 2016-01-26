class Breach < ActiveRecord::Base
  belongs_to :organization

  def notify
    org = self.organization
    users = org.users
    users.each do |user|
      UserMailer.breach_email(user, org).deliver_now
    end
  end

end
