class EndUser::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).page(params[:page]).per(15).reverse_order
    @comment = Comment.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "Update successfully"
    @posts = Post.where(user_id: params[:id]).page(params[:page]).per(15).reverse_order
    @comment = Comment.new
    redirect_to end_user_user_path(current_user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "アカウントを削除しました。"
    redirect_to new_user_registration_path
  end

  def following
    @user = User.find(params[:id])
    @followings = User.find(params[:id]).followings.page(params[:page]).per(16).reverse_order
  end

  def followed
    @user = User.find(params[:id])
    @followers = User.find(params[:id]).followers.page(params[:page]).per(16).reverse_order
  end

  def nice
    @user = User.find(params[:id])
    @niced_posts = @user.niced_posts.page(params[:page]).per(15).reverse_order
    @comment = Comment.new
  end

  def check
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
