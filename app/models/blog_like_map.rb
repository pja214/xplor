class BlogLikeMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
end
