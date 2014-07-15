require 'rails_helper'

RSpec.describe BlogLikeMap, :type => :model do
  let(:blog_like_map) { FactoryGirl::create(:blog_like_map) }

  it "has a valid user ID" do
    expect(blog_like_map.user_id.between?(1, User.count)).to eq(true)
  end

  it "has a valid blog ID" do
    expect(blog_like_map.blog_id.between?(1, Blog.count)).to eq(true)
  end
end
