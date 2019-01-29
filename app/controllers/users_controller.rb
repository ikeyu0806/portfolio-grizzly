# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(name: params[:name])
    @posts = @user.posts.order(created_at: :desc)
  end
end
