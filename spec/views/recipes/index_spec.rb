require 'rails_helper'

RSpec.describe 'Recipe index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user_one = User.create(name: 'Tom')
      @user_two = User.create(name: 'Dianne')
      @recipe_one = Recipe.create(name: 'Recipe 3', preparation_time: '12:05', cooking_time: '6:45',
                                  description: 'Lorem ipsum dolor sit', user: @user_one.id)
      @recipe_two = Recipe.create(name: 'Cheeseburger Soup', preparation_time: '12:05', cooking_time: '6:45',
                                  description: 'Lorem ipsum dolor sit', user_id: 2, public: true)

      @recipes = Recipe.all
      visit recipes_path
    end

    it 'Can see the names of each recipe' do
      @recipes.each do |recipe|
        expect(page).to have_content(recipe.name.to_s)
      end
    end

    it 'Can see the names of each recipe' do
      @recipes.each do |recipe|
        expect(page).to have_content(recipe.description.to_s)
      end
    end

    it 'Can see a button that lets me Add New Recipe' do
      expect(page).to have_content('Add New Recipe')
    end

    it 'Can click on Add New Recipe, to be redirected to a form to Add New Recipe' do
      visit recipes_path
      @recipes.each do |recipe|
        click_link recipe.name
        expect(page.current_url).to match recipe_path(recipe.id)
      end
    end
  end
end
