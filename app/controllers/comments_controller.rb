class CommentsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment)
        .permit(:content, :user_id, :post_id)
        .merge(user_id: current_user.id)
  end
end
