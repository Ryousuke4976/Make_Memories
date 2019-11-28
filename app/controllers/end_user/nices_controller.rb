class EndUser::NicesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    nice = current_user.nices.new(post_id: post.id)
    if nice.save
      flash[:success] = 'いいねしました!'
    else
      flash[:alert] = 'いいねできませんでした'
    end
    redirect_to end_user_posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    nice = current_user.nices.find_by(post_id: post.id)
    if nice.destroy
      flash[:success] = 'いいねを解除しました!'
    else
      flash[:alert] = 'いいねを解除できませんでした'
    end
    redirect_to end_user_posts_path
  end
end
