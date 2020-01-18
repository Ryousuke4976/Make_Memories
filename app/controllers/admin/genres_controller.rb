class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.with_deleted.page(params[:page]).reverse_order
  end

  def show
    @post_genres = PostGenre.with_deleted.where(genre_id: params[:id]).page(params[:page]).reverse_order
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:alert] = "#{@genre.name}を削除しました。"
    redirect_to admin_genres_path
  end
end
