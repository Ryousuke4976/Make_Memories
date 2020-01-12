class EndUser::RelationsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    @count = @user.followers.count
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    @count = @user.followers.count
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
end