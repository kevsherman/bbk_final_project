class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected

    def after_sign_up_path_for(resource)
      new_main_event_path
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :phone, :image_url)
      end
    end

end