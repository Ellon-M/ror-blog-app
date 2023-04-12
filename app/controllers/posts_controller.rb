class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    # all posts for one user
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    # a single post - with post details for a specific user
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])

    @comments = @post.comments
    @likes = @post.likes
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(author: @user, title: params[:post][:title], text: params[:post][:text])

    if @post.save
      @post.update_post_counter
      flash[:notice] = 'Post created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash.alert = 'Something Went Wrong. Please Try Again!'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'The Post was successfully deleted.'
    redirect_to user_posts_url
  end

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
