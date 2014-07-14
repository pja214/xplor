require 'rails_helper'

RSpec.describe Blog, :type => :model do
  let(:blog) { FactoryGirl.create(:blog) }

  context "creation of BlogReader objects" do

    it "creates the correct number of objects" do
      br_count = BlogReader.count
      blog.save
      expect(BlogReader.count).to eq(br_count + User.count)
    end
  end
end
