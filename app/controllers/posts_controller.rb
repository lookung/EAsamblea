class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  def create
    Post.create(title: post_params[:title], text: post_params[:text], user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  private
  def post_params
    params.permit(:title, :text)
  end
end
