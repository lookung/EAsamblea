class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @posts = current_user.postss.page(params[:page]).per(5).order("created_at DESC")
  end
end
