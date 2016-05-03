class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit({ roles: [:professor] }, :first_name, :last_name, :email, :password, :password_confirmation)
   end
 end

 def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:first_name, :last_name, :avatar, :avatar_cache, :email, :bio, :password, :password_confirmation, :current_password)
    }
  end

 def authenticate_user!(options={})
   if user_signed_in?
     super(options)
   else
     redirect_to login_path, :notice => 'if you want to add a notice'
     ## if you want render 404 page
     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
   end
 end
end
