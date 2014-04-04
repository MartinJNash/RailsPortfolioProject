class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save!
      redirect_to request.referer, notice: "Successfully created comment!"
    else
      redirect_to request.referer, notice: "BAD TIMES!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

end
