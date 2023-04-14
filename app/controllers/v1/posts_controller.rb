class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :find_user

  def index
    return unless @user

    @posts = @user.posts.order(:created_at)
    render json: { data: { posts: @posts } }, status: :ok
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
