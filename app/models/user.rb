class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_profile_maps
  has_many :blogs, :through => :blog_profile_maps
  has_many :blog_like_maps
  has_many :blogs, :through => :blog_like_maps
  has_many :blog_dislike_maps
  has_many :blogs, :through => :blog_dislike_maps

  private

    # Placeholder implementation, recommend random blog
    def getRecommendedBlogID
      # self.last_recommendation_time returns an ActiveSupport::TimeWithZone object
      if (Time.zone.now - self.last_recommendation_time).to_i / 1.day > 1
        self.update(last_recommendation_time: DateTime.now)
        self.update(current_recommendation: rand(Blog.count) + 1)
      end
      return self.current_recommendation
    end
end
