class Admin::PostsController < ApplicationController
  def index
    @posts = Post.with_deleted.page(params[:page]).reverse_order
  end

  def destroy
  end
end
