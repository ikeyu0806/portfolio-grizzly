# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :post_user?

    def create
      @post.like(current_user)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end

    def destroy
      @post.unlike(current_user)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end

    private

    def like_params
      params.require(:like)
            .merge(user_id: current_user.id, post_id: @post.id)
    end

    def post_user?
      @post = Post.find(params[:post_id])
      head :forbidden if @post.post_user?(current_user)
    end
  end
end
