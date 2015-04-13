class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_filter :configure_permitted_parameters, if: :devise_controller?

    # Make R instance available to all
    #def InitR
    # 	 	@r = RSRuby.instance
    #  	return @r
  	#end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :administrator, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :administrator, :email, :current_password, :password, :password_confirmation) }
    end 


end
