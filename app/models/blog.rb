class Blog < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true
  has_many :blog_readers
  has_many :users, :through => :blog_readers

  after_create :init

  def init
    (1..User.count).each do |user_id|
      BlogReader.create(user_id: user_id, blog_id: self.id, profiled: false, \
        liked: false, disliked: false)
    end
  end
end
