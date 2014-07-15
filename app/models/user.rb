class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_readers
  has_many :blogs, :through => :blog_readers

  after_create :init

  private

    # Automatically generates a BlogReader object for each blog in the db
    def init
      self.update(last_recommendation_time: DateTime.now - 2)
      (1..Blog.count).each do |blog_id|
        BlogReader.create(user_id: self.id, blog_id: blog_id, profiled: false, \
          liked: false, disliked: false)
      end
    end

    # Placeholder implementation
    def getRecommendedBlogID
      # self.last_recommendation_time returns an ActiveSupport::TimeWithZone object
      if (Time.zone.now - self.last_recommendation_time).to_i / 1.day > 1
        self.update(last_recommendation_time: DateTime.now)
        self.update(current_recommendation: rand(Blog.count) + 1)
      end
      return self.current_recommendation
    end
end
