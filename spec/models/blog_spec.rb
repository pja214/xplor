require 'rails_helper'

RSpec.describe Blog, :type => :model do
  let(:blog) { FactoryGirl.create(:blog) }

  it "prints correctly" do
    expect(blog.name).to eq(blog.print_name)
  end
end
