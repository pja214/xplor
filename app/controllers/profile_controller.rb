class ProfileController < ApplicationController
  def index
    @blogs = Blog.joins(:blog_profile_maps).where(blog_profile_maps: { user_id: current_user.id })
  end

  def create
  end

  def destroy
  end
end
