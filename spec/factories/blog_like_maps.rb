FactoryGirl.define do
  factory :blog_like_map do
    u_id = rand(User.count) + 1
    b_id = rand(Blog.count) + 1
    user_id u_id
    blog_id b_id
  end
end