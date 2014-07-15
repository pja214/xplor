class DislikeController < ApplicationController
  def index
    @blogs = Blog.joins(:blog_dislike_maps).where(blog_dislike_maps: { user_id: current_user.id })
  end

  def create
  end

  def destroy
  end
end
