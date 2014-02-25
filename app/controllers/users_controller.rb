class UsersController < ApplicationController
  def show
  	@user = current_user
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build(params[:micropost])
  end
end  

