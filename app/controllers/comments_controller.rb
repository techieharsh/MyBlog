class CommentsController < ApplicationController
  def create

    if visitor.save
      flash[:notice] = "Successfully created new comment."
    else
      flash[:alert] = "There was a problem creating your content"
    end

    redirect_to posts_path
  end

  private

  def visitor_comments_params
    params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end

  def visitor
    VisitorCommentService.new(visitor_comments_params).visitor
  end
end
