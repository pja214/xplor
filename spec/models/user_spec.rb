require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  context "creation of BlogReader objects" do

    it "creates the correct number of objects" do
      br_count = BlogReader.count
      user.save
      expect(BlogReader.count).to eq(br_count + Blog.count)
    end
  end
end
