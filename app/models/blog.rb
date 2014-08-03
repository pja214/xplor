class Blog < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  has_many :blog_profile_maps
  has_many :users, :through => :blog_profile_maps
  has_many :blog_like_maps
  has_many :users, :through => :blog_like_maps
  has_many :blog_dislike_maps
  has_many :users, :through => :blog_dislike_maps
  has_many :recommendations

  def print_name
    "#{name} - #{url}"
  end
end
