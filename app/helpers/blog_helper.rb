module BlogHelper
  def find_blog_reader_id(user_id, blog_id)
    return BlogReader.find_by(user_id: user_id, blog_id: blog_id).id
  end
end
