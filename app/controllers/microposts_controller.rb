class MicropostsController < ApplicationController
  before_filter :user_signed_in?, only: [:create, :destroy]
  respond_to :html, :json
  include MicropostsHelper

  def index
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to root_path }
        format.js
      else
        format.html { render 'static_pages/home' }
      end
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

  def vote
    value = params[:type] == "up" ? 1 : -1
    @micropost = Micropost.find(params[:id])
    @micropost.add_or_update_evaluation(:votes, value, current_user)
    @count_votes = { count: @micropost.reputations.map(&:value) }
    render json: @count_votes
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_url 
  end
end
