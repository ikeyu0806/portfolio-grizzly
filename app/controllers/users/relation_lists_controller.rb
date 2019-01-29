# frozen_string_literal: true

module Users
  class RelationListsController < ApplicationController
    def index
      @user = User.find_by(name: params[:user_name])
      @followings = @user.following
      @followers = @user.followers
    end
  end
end
