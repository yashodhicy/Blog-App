class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :posts_counter, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :posts_counter, :email, :password, :current_password)
    end
  end

  # private

  # def after_sign_out_path_for(resource_or_scope)
  #   new_user_session_path
  # end

  # def after_sign_in_path_for(resource)
  #   # Customize the path you want to redirect to after successful sign-in
  #   users_path
  # end
end
