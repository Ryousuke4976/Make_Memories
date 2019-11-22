class EndUser::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    redirect_to end_user_posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
