class EndUser::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def following
  end

  def followed
  end

  def post
  end

  def nice
  end

  def check
  end
end
