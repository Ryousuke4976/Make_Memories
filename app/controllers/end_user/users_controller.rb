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
    if @user.update(user_params)
      flash[:success] = "ユーザ情報を変更しました!"
      @posts = Post.where(user_id: params[:id]).page(params[:page]).per(15).reverse_order
      @comment = Comment.new
      redirect_to end_user_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "アカウントを削除しました。"
      redirect_to new_user_registration_path
    else
      flash[:alert] = "アカウントを削除できませんでした"
      redirect_to end_user_user_path(current_user)
    end
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

  def search
    @user = current_user
    if params[:search] == ""
      @users = []
    else
      @users = User.with_deleted.search(params[:search]).page(params[:page]).reverse_order
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
