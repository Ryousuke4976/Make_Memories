class EndUser::NicesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    nice = current_user.nices.new(post_id: post.id)
    nice.save
    redirect_to end_user_posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    nice = current_user.nices.find_by(post_id: post.id)
    nice.destroy
    redirect_to end_user_posts_path
  end
end
