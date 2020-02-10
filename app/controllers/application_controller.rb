class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name])
    end

    def after_sign_in_path_for(resource)
     public_user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
     root_path
    end

end
