class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_readers
  has_many :blogs, :through => :blog_readers

  after_create :init

  def init
    (1..Blog.count).each do |blog_id|
      BlogReader.create(user_id: self.id, blog_id: blog_id, profiled: false, \
        liked: false, disliked: false)
    end
  end
end
