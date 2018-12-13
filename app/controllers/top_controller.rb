class TopController < ApplicationController
  def index
    @recent_posts = Post.all.order(:created_at).limit(10)
  end
end
