class PostsController < ApplicationController
  def index
    # all posts for one user
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    # a single post - with post details for a specific user
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])

    @comments = @post.comments
    @likes = @post.likes
  end
end
