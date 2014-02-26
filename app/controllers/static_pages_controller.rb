class StaticPagesController < ApplicationController
  def home
  	@haikus = Micropost.find_with_reputation(:votes, :all, order: 'votes desc')
    @fedor = Micropost.all
    @user = current_user
    if user_signed_in?
      @microposts = @user.microposts.paginate(page: params[:page])
      @micropost = current_user.microposts.build(params[:micropost])
    end
  end
end