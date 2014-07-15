class LikeController < ApplicationController
  def index
    @blogs = Blog.joins(:blog_like_maps).where(blog_like_maps: { user_id: current_user.id })
  end

  def create
  end

  def destroy
  end
end
