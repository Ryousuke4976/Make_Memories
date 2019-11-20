class EndUser::RelationsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザをフォローしました'
      redirect_to end_user_user_path(@user)
    else
      flash.now[:alert] = 'ユーザのフォローに失敗しました。'
      redirect_to end_user_user_path(@user)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザのフォローを解除しました。'
      redirect_to end_user_user_path(@user)
    else
      flash.now[:alert] = 'ユーザのフォロー解除に失敗しました。'
      redirect_to end_user_user_path(@user)
    end
  end

  private
    def set_user
      @user = User.find(params[:relation][:user_id])
    end
end