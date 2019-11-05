class LikesController < ApplicationController
  
    def create
    @post = Post.find(params[:post_id])
    puts "-----------------------------------------A"
    puts "------------------------------------------A2"
    if !@post.iine?(current_user) 
      puts "----------------------------------------b"
      @post.iine(current_user)
      @post.reload
      puts "------------------------------------E"
      # render "create"
      puts "----------------------------------------c"
      respond_to do |format|
        puts "----------------------------------------d"
        format.html { redirect_to request.referrer || root_url }
        puts "----------------------------------------"
        format.js
        puts "----------------------------------------e"
      end
    end
  end

  def destroy
    puts "-----------------------------------------destroy"
    @post = Like.find(params[:id]).post
    if @post.iine?(current_user)
      @post.uniine(current_user)
      @post.reload
      # render "detroy"
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end