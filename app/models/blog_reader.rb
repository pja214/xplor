class BlogReader < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
end
