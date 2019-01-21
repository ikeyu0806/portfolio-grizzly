class CommentsController < ApplicationController
  before_action :destroyable?, only: :destroy

  def new
    @post = Post.new
  end

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
          .permit(:content, :user_id, :post_id)
          .merge(user_id: current_user.id)
  end
end
