class MicropostsController < ApplicationController
  before_filter :user_signed_in?, only: [:create, :destroy]
  include MicropostsHelper
  
  def index
  end
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'  
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
 
   if @micropost.update_attributes(params[:micropost])
    redirect_to user_root_path
   else
    render 'edit'
   end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_url
  end
end