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

  private

    def member_params
      params.require(:member).permit(:first_name, :last_name, :gender, :email, :password)
    end

end
