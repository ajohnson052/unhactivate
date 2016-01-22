class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:full_name,
        :email, :password, :password_confirmation, :terms)
    end
  end

end
