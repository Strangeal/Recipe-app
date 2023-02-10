require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  describe 'public recipes controller' do
    before(:each) do
      get public_recipes_path
    end

    it 'render index action' do
      expect(response).to render_template(:index)
    end

    it 'return status code ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'return index view text' do
      expect(response.body).to include('Welcome to the Public Recipe Index')
    end
  end
end
