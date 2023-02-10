require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  describe 'food controller' do
    
    context 'index action' do
      it 'render index action' do
        get '/recipes/'
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        get '/recipes/'
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        get '/recipes/'
        expect(response.body).to include('Welcome to the Recipe Index')
      end
    end
  end
end