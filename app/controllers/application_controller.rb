class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def authorize
    session[:return_to] = request.fullpath
    redirect_to new_session_path unless current_member
  end
end
