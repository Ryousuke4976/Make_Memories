class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.with_deleted.page(params[:page]).reverse_order
  end

  def search
    if params[:search] == ""
      @posts = []
    else
      @posts = Post.with_deleted.search(params[:search]).page(params[:page]).reverse_order
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to admin_posts_path
  end
end
