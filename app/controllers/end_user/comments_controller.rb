class EndUser::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントしました!'
    else
      flash[:alert] = 'コメントを失敗しました'
    end
    redirect_to end_user_posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
