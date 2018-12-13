class TopController < ApplicationController
  def index
    @recent_posts = Post.load_recent_posts
  end
end
