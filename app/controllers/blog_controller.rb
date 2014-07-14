class BlogController < ApplicationController
  def index
    @blogs = Blog.all
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
