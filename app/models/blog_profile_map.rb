class BlogProfileMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :blog_id, presence: true, numericality: { only_integer: true, \
    greater_than: 0, less_than_or_equal_to: Blog.count }
  validates :user_id, presence: true, numericality: { only_integer: true, \
    greater_than: 0, less_than_or_equal_to: User.count }
  validate :user_did_not_already_profile

  def user_did_not_already_profile
    if BlogProfileMap.find_by(user_id: self.user_id, blog_id: \
      self.blog_id) == nil
    else
      errors.add(:blog_id, "already in profile")
    end
  end
end
