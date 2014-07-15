class BlogLikeMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :blog_id, presence: true, numericality: { only_integer: true, \
    greater_than: 0, less_than_or_equal_to: Blog.count }
  validates :user_id, presence: true, numericality: { only_integer: true, \
    greater_than: 0, less_than_or_equal_to: User.count }
end
