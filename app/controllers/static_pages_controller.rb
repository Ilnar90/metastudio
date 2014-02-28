class StaticPagesController < ApplicationController
  def home
    @view_1 = Micropost.by_votes
    @user = current_user
    if user_signed_in?
      @microposts = @user.microposts.paginate(page: params[:page])
      @micropost = current_user.microposts.build(params[:micropost])
    end
  end
end
