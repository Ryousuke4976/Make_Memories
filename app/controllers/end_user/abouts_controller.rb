class EndUser::AboutsController < ApplicationController
  before_action :authenticate_user!
  def index
    @abouts = About.page(params[:page]).reverse_order
  end
end
