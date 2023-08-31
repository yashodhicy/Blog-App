class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @current = current_user
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.build(text: comment_parameters[:text], user_id: @current.id)
    respond_to do |format|
      format.html do
        if @new_comment.save
          redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully'
        else
          redirect_to user_post_path(current_user, @post), alert: 'Comment not created successfully'
        end
      end
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
