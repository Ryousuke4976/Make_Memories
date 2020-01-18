class EndUser::GenresController < ApplicationController
  def index
    @user = current_user
    @genres = Genre.all
  end

  def show
    @user = current_user
    @post_genres = PostGenre.where(genre_id: params[:id]).page(params[:page]).reverse_order
    @comment = Comment.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    @post = Post.new
    respond_to do |format|
      if @genre.save
        format.html
        format.js
      else
        format.js {render 'fail'}
      end
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
