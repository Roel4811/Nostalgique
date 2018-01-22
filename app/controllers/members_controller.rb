class MembersController < ApplicationController

  def new
  end

  def create
    member = Member.new(member_params)
    if member.save
      session[:member_id] = member.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def log_in
  end

  def create_log_in
    member = Member.find_by(email: log_in_params[:email])
    if member && member.authenticate(log_in_params[:password])
      session[:member_id] = member.id
      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = root_path if url.eql?(log_out_members_path)
      puts "URL to redirect to: #{url}"
      redirect_to url
    else
      puts "failed to log-in"
      redirect_to log_in_members_path
    end
  end

  def log_out
    session[:member_id] = nil
    redirect_to log_in_members_path
  end

  def new_password_reset
  end

  def password_reset
    member = Member.find_by(password_recovery_params)
    member.send_password_reset
    redirect_to root_url, notice: "Email sent with password reset instructions."
  end

  private

    def member_params
      params.require(:member).permit(:first_name, :last_name, :gender, :email, :password)
    end

    def log_in_params
      params.require(:member).permit(:email, :password)
    end

    def password_recovery_params
      params.require(:member).permit(:email)
    end
end
