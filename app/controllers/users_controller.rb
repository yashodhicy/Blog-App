class UsersController < ActionController::Base
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
  end
end
