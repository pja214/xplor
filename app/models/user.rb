class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_profile_maps
  has_many :blogs, :through => :blog_profile_maps
  has_many :recommendations


  def get_recommended_blog_id

    # Prevents type errors with datetime arithmetic
    if self.last_recommendation_time == nil
      self.update(last_recommendation_time: DateTime.new)
    end

    # self.last_recommendation_time returns an ActiveSupport::TimeWithZone object
    if (Time.zone.now - self.last_recommendation_time).to_i / 1.day > 1

      self.update(last_recommendation_time: DateTime.now)

      # Recommendation objects have fields (user_id, blog_id, value)
      recommendations = self.recommendations

      # The daily recommendation samples randomly, using the recommendation
      # values as weights
      value_array = Array.new
      i = 0
      recommendations.each do |r|
        value_array[i] = r['value']
        i = i + 1
      end

      value_marker = rand * value_array.inject(:+)
      partial_sum = 0
      r_pointer = 0
      while partial_sum < value_marker
        partial_sum = partial_sum + value_array[r_pointer]
        r_pointer = r_pointer + 1
      end
      r_pointer = r_pointer - 1
    end

    new_recommendation = recommendations[r_pointer]
    self.update(current_recommendation: new_recommendation.blog_id)
    
    return self.current_recommendation
  end
end
