class Admin::MembersController < Admin::ApplicationController

  def index
    @members = Member.all
    @members_count = @members.count
  end

end
