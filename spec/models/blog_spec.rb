require 'rails_helper'

RSpec.describe Blog, :type => :model do
  let(:blog) { FactoryGirl.create(:blog) }

  context "interaction with user" do
    let(:user) { FactoryGirl.create(:user) }

    it "should recognize user objects" do 
      blog.save
      user.save
      expect(user.blogs).not_to eq(nil)
    end
  end

  context "creation of BlogReader objects" do

    it "creates the correct number of objects" do
      br_count = BlogReader.count
      blog.save
      expect(BlogReader.count).to eq(br_count + User.count)
    end
  end
end
