class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.includes(comments: :user).find(params[:id])
    @current = current_user
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @new_post = current_user.posts.build(post_parameters)
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to user_post_path(current_user, @new_post), notice: 'Post was successfully created.'
        else
          flash.now[:alert] = 'Post could not be created. Please try again.'
          render :new
        end
      end
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
