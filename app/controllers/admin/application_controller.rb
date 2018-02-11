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

  def show_or_hide_deleted
    if params[:show_or_hide_deleted] == "yes"
      "only_deleted"
    elsif params[:show_or_hide_deleted] == "no"
      "without_deleted"
    else
      "all"
    end
  end
  helper_method :show_or_hide_deleted

  def sort_column
    'id'
  end
  helper_method :sort_column

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
  helper_method :sort_direction

end
