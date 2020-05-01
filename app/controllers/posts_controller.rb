class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @favorite_users = @post.favorite_users
    @comment = current_user.comments.build
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
