class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def create
    @current = current_user
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: @current.id)

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to user_post_path(current_user, @post), notice: 'you liked the post'
        else
          redirect_to user_post_path(current_user, @post), alert: 'unable to like'
        end
      end
    end
  end
end
