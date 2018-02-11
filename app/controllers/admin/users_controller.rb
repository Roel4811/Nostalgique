class Admin::UsersController < Admin::ApplicationController

  def log_in
  end

  def create_log_in
    user = User.find_by(email: log_in_params[:email], deleted_at: nil)

    if user && user.authenticate(log_in_params[:password])
      session[:user_id] = user.id
      url = session[:return_to] || root_path
      session[:return_to] = nil
      url = admin_root_path if url.eql?(log_out_admin_users_path)
      flash[:notice] = 'You are looged in'
      redirect_to url
    else
      flash[:error] = 'Something went wrong'
      redirect_to log_in_admin_users_path
    end
  end

  def log_out
    session[:member_id] = nil
    redirect_to log_in_admin_users_path
  end


  private

  def log_in_params
    params.require(:user).permit(:email, :password)
  end
end
