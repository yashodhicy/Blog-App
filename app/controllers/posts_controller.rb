class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @new_post = current_user.posts.build(post_parameters)
    respond_to do |format|
        if @new_post.save
          format.html { redirect_to user_post_path(current_user , @new_post), notice: "Post was successfully created." }
        else
          format.html do
            flash.now[:alert] = "Post could not be created. Please try again."
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
