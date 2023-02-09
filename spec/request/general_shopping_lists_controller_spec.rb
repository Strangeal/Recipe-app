require 'rails_helper'

RSpec.describe "GeneralShoppingListController", type: :request do
  describe 'General shopping list controller' do
    before(:each) do
      get general_shopping_lists_path
    end

     it 'render index action' do
        expect(response).to render_template(:index)
      end

      it 'return status code ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'return index view text' do
        expect(response.body).to include('Welcome to the General Shopping List Index')
    end
  end
end