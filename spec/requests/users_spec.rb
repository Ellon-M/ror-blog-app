require 'rails_helper'

describe '/posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end
    it 'has a successful response' do
      expect(response).to be_successful
    end
    it 'correctly renders the index html template' do
      expect(response).to render_template(:index)
    end
  end
end
