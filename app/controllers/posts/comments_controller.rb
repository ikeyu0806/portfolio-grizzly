module Posts
  class CommentsController < ApplicationController
    before_action :destroyable?, only: :destroy
    before_action :authenticate_user!
    before_action :set_post

    def create
      @comment = Comment.new(comment_params)
      @comment.save
      redirect_back(fallback_location: root_path)
    end

    def destroy
      @comment.destroy
      redirect_back(fallback_location: root_path)
    end

    private

    def destroyable?
      @comment = Comment.find(params[:id])
      head :forbidden unless @comment.destroyable?(current_user)
    end

    def comment_params
      params.require(:comment)
            .permit(:content)
            .merge(user_id: current_user.id, post_id: @post.id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
