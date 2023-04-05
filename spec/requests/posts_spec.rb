require 'rails_helper'

describe "/posts", type: :request do

  describe "GET /index" do
    before (:example) do
      get '/users/1/posts'
    end
    it "has a successful response" do
      expect(response).to be_successful
    end
    it "correctly renders the index html template" do
      expect(response).to render_template(:index)
    end
    it "contains the placeholder text" do
      expect(response.body).to include("Here is a list of posts for all users")
    end
  end

  describe "GET /show" do
    before (:example) do
      get '/users/1/posts/1'
    end
    it "renders a successful response" do
      expect(response).to be_successful
    end
    it "correctly renders the show template" do
      expect(response).to render_template(:show)
    end
    it "contain the placeholder text" do
      expect(response.body).to include("Here is a list of posts for a given user")
    end
  end
end