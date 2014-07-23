class ProfileController < ApplicationController
  def index
    @blogs_saved = Blog.joins(:blog_profile_maps).where(blog_profile_maps: { user_id: current_user.id })
    @blogs_liked = Blog.joins(:blog_like_maps).where(blog_profile_maps: { user_id: current_user.id })
    @recommended_blog = Blog.find_by(id: current_user.get_recommended_blog_id)
  end

  def new
    @new_blog = BlogProfileMap.new
  end

  def create
    blog_id = params[:blog_profile_map][:blog_id]
    @profiled_blog = BlogProfileMap.new(user_id: current_user.id, blog_id: blog_id)
    if @profiled_blog.save
      blog_name = Blog.find_by(id: blog_id).name
      flash[:success] = "Added #{blog_name} to your profile!"
    end
    if @profiled_blog.errors.full_messages != nil
      flash[:failure] = @profiled_blog.errors.full_messages
    end
    redirect_to profile_url
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Deleted #{@blog.name}"
    redirect_to profile_url
  end

end
