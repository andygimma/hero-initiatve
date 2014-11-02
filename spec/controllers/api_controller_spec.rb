require 'spec_helper'

describe ApiController do

  describe "GET 'locations'" do
    it "returns http success" do
      get 'locations'
      response.should be_success
    end
  end

  describe "GET 'workshops'" do
    it "returns http success" do
      get 'workshops'
      response.should be_success
    end
  end

  describe "GET 'map'" do
    it "returns http success" do
      get 'map'
      response.should be_success
    end
  end

  describe "GET 'sign_up'" do
    it "returns http success" do
      get 'sign_up'
      response.should be_success
    end
  end

end
