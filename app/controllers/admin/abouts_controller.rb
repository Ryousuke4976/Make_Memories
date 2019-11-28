class Admin::AboutsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @abouts = About.page(params[:page]).reverse_order
  end

  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)
    if @about.save
      flash[:success] = '概要を追加しました。'
      redirect_to admin_abouts_path
    else
      render 'new'
    end
  end

  private

  def about_params
    params.require(:about).permit(:content)
  end
end
