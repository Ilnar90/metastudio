class StaticPagesController < ApplicationController
  def home
      @fedor = Micropost.all
      @user = current_user
  end
end