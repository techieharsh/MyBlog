class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
    else
      if params[:status] == "false"
      @comments = Comment.where(status: 0).page params[:page]
      else
        @comments = Comment.where(status: 1).page params[:page]
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: params[:status])
      redirect_to admin_comments_path, notice: 'Successfully updated comment.'
    else
      redirect_to admin_comments_path, notice: 'There was a problem updating comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to admin_comments_path, notice: 'Successfully deleted comment.'
  end
end
