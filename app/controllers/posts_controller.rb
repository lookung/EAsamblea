class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  def create
    Post.create(post_params)
  end

  def new
    @post = Post.new
  end

  private
  def post_params
    params.permit(:title, :text)
  end
end
