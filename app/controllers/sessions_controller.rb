class SessionsController < ApplicationController

  def new
  end

  def create
    member = Member.find_by(email: params[:email])
    if member && member.authenticate(params[:password])
      session[:member_id] = member.id
      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?(logout_session_path)
      puts "URL to redirect to: #{url}"
      redirect_to url
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to new_session_path
  end
end
