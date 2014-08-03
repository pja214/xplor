class Recommendation < ActiveRecord::Base
  has_one :user
  has_one :blog
end
