class TopController < ApplicationController
  def index
    @recent_posts = Post.recent_posts
  end
end
