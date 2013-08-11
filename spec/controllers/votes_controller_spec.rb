require 'spec_helper'

describe VotesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    it "returns http succes" do
      put 'update'
      response.should be_success
    end
  end
end
