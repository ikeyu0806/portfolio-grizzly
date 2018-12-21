module Users
  class PostsController < ApplicationController
    def index
      @user = User.find_by(name: params[:user_name])
      @posts = @user.posts.order(created_at: :desc)
    end
  end
end
