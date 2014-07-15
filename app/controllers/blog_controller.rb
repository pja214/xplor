class BlogController < ApplicationController
  def index
    @blogs = Blog.joins(:blog_readers).where("blog_readers.profiled = 'true' \
      AND blog_readers.user_id = :user_id", { user_id: current_user.id })
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @index
    else
      render 'new'
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:name, :url)
    end
end
