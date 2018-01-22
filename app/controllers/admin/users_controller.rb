class Admin::UsersController < Admin::ApplicationController

  def sign_in
    user = User.find_by(email: sign_in_params[:email], deleted_at: nil)

    if user && user.authenticate(sign_in_params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You are looged in'
      redirect_to admin_root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to admin_root_path
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
