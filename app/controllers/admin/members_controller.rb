class Admin::MembersController < Admin::ApplicationController
  before_action :authorize
  
  def index
    @members = Member.all
    @members_count = @members.count
  end

end
