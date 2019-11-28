class EndUser::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.page(params[:page]).reverse_order
    @comment = Comment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿しました!'
      redirect_to end_user_posts_path
    else
      render action: :new
    end
  end

  def search
    @user = current_user
    if params[:search] == ""
      @posts = []
    else
      @posts = Post.search(params[:search]).page(params[:page]).reverse_order
    end
    @comment = Comment.new
  end

  private
    def post_params
      params.require(:post).permit(:content, :image)
    end
end
