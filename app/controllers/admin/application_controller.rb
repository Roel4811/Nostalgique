class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authorize

  layout 'admin'

  def home
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    session[:return_to] = request.fullpath
    redirect_to log_in_admin_users_path unless current_user
  end

end
