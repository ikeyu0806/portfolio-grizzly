class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(name: params[:name])
    @posts = @user.posts.order(created_at: :desc)
  end
end
