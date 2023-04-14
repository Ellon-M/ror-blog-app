class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post
  def index
    if @post
      @comments = Comment.where({ post_id: id }).order(:created_at)
      render json: { data: { comments: @comments } }, status: :ok
    else
      render json: { status: 'Failure', error: 'Post Not Found' }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: @user.id, post_id: @post.id, text: params[:comment][:text])
    if @comment.save
      render json: @comment
    else
      render error: { error: 'Unable to create comments' }, status: 400
    end
    redirect_to user_post_path(@user, @post)
  end

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
