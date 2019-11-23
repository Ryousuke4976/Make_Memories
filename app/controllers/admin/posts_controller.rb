class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.search(params[:search]).page(params[:page]).reverse_order
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to admin_posts_path
  end
end
