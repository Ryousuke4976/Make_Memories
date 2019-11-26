class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.with_deleted.page(params[:page]).reverse_order
  end

  def search
    @users = User.with_deleted.search(params[:search]).page(params[:page]).reverse_order
  end

  def show
    @user = User.with_deleted.find(params[:id])
    @posts = Post.with_deleted.where(user_id: @user).page(params[:page]).reverse_order
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = 'ユーザを削除しました。'
    redirect_to admin_users_path
  end
end
