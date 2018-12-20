class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @posts = Post.where(user_id: current_user.id)
  end
end
