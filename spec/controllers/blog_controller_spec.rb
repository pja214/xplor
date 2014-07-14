require 'rails_helper'

RSpec.describe BlogController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      expect(response).to be_success
    end
  end

end
