require 'rails_helper'

RSpec.describe 'General Shopping List index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user_1 = User.create(name: 'Tom')
      @user_2 = User.create(name: 'Dianne')
      @food_1 = Food.create(name: 'Food 1', quantity: 1, price: 1.00, user_id: 1)
      @recipe_1 = Recipe.create(name: 'Recipe 3', preparation_time: '12:05', cooking_time: '6:45',
                                description: 'Lorem ipsum dolor sit', user_id: 1)
      @recipe_2 = Recipe.create(name: 'Cheeseburger Soup', preparation_time: '12:05', cooking_time: '6:45',
                                description: 'Lorem ipsum dolor sit', user_id: 2, public: true)
      @recipe_food_1 = RecipeFood.create(quantity: 5, food_id: 1, recipe_id: 1)

      visit general_shopping_lists_path
    end

    it 'Can see the names of each recipe' do
      expect(page).to have_content('General Shopping List')
    end

    it 'Can see the total price of all the missing ingredients' do
      expect(page).to have_content('Total value of food needed:')
    end

    it 'Can see the total number of items to buy' do
      expect(page).to have_content('Total amount of itmes to buy')
    end
  end
end
