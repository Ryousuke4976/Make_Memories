class EndUser::AboutsController < ApplicationController
  before_action :authenticate_user!
  def index
    @abouts = About.all
  end
end
