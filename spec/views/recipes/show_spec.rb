require 'rails_helper'

RSpec.describe 'Recipe show view', type: :system do
  describe 'Show page' do
    before(:each) do
      # @user_1 = User.create(name: "Tom")
      # @user_2 = User.create(name: "Dianne")
      # @food_1 = Food.create(name: "Apple", measurement_unit: "5kg", price: 1.99, quantity: 3, user_id: 1)
      @recipe_1 = Recipe.create(name: "Creamy White Chili", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit", user: @user_1)
      # @recipe_2 = Recipe.create(name: "Cheeseburger Soup", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit", user_id: 2, public: true)

      # @entry_1 = RecipeFood.create(quantity: 12, recipe_id: 1, food: @food_1)

    end
    
    it 'Can see recipe name' do
      visit recipe_path(@recipe_1)
      expect(page).to have_content('Creamy White Chili')
    end


  end

end