require 'rails_helper'

RSpec.describe BlogDislikeMap, :type => :model do
  let(:blog_dislike_map) { FactoryGirl::create(:blog_dislike_map) }

  it "has a valid user ID" do
    expect(blog_dislike_map.user_id.between?(1, User.count)).to eq(true)
  end

  it "has a valid blog ID" do
    expect(blog_dislike_map.blog_id.between?(1, Blog.count)).to eq(true)
  end
end
