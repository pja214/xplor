class ProfileController < ApplicationController
  def index
    @blogs_saved = Blog.joins(:blog_profile_maps).where(blog_profile_maps: { user_id: current_user.id })
    @recommended_blog = Blog.find_by(id: current_user.get_recommended_blog_id)
  end

  def new
    @new_blog = BlogProfileMap.new
    @blogs = Blog.order(:name)
  end

  def create
    @profiled_blog = BlogProfileMap.new(user_id: current_user.id, blog_id: \
      params["blog"]["id"])
    if @profiled_blog.save
      blog_name = Blog.find_by(id: params["blog"]["id"]).name
      flash[:success] = "Added #{blog_name} to your profile!"
    end
    if @profiled_blog.errors.full_messages != nil
      flash[:failure] = @profiled_blog.errors.full_messages
    end
    redirect_to profile_url
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog_profile_map = BlogProfileMap.find_by(user_id: current_user.id, blog_id: params[:id])
    @blog_profile_map.destroy
    flash[:success] = "Deleted #{@blog.name}"
    redirect_to profile_url
  end

end
