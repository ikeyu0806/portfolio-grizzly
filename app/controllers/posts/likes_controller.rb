module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
      @post.like(current_user)
      respond_to do |format|
        format.html { redirect_to @post }
        # format.html { redirect_back(fallback_location: root_path)  }
        # format.html
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

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
