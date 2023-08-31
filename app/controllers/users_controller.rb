class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
