class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:search] != nil
      @users = User.search(params[:search]).page(params[:page]).reverse_order
    else
      @users = User.with_deleted.page(params[:page]).reverse_order
    end
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
