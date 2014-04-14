class CommentsController < ApplicationController

  def index
    load_commentable
    @comments = @commentable.comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to request.referer, notice: "Successfully created comment!"
    else
      redirect_to request.referer, notice: "Couldn't create comment."
    end
  end


  def update
    load_commentable
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "Successfully edited comment!"
    else
      redirect_to request.referer, notice: "Couldn't update comment"
    end
  end

  # NOT RESTFUL
  # AM I A CRIMINAL NOW?
  def approve
    @comment = Comment.find(params[:id])

    if @comment.update(approved: true)
      redirect_to request.referer, notice: "Successfully approved comment!"
    else
      redirect_to request.referer, notice: "Can't approve comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :approved)
  end

  def update_params
    params.require(:comment).permit(:approved)
  end

  def load_commentable
    # fetch_commentable_from_params
    klass = [ Post ].detect { |c| params["#{c.name.underscore}_id"]}
    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  # def fetch_commentable_from_params
  #   return unless params[:commentable_type].present?
  #   return unless params[:commentable_id].present?
  #   klass = params[:commentable_type].classify.constantize
  #   @commentable = klass.find(params[:commentable_id])
  # end


end
