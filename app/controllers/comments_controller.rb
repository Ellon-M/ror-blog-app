class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: @user, post: @post, text: params[:comment][:text])
    @comment.save
    redirect_to user_post_path(@user, @post)
  end
  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "The Comment was successfully deleted."
    redirect_to user_post_url(User.find(params[:user_id]), Post.find(params[:post_id]))
   end
end