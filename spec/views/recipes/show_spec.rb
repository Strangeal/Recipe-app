require 'rails_helper'

RSpec.describe 'Recipe show view', type: :system do
  describe 'Show page' do
    before(:each) do
      @user_1 = User.create(name: "Tom")
      @food_1 = Food.create(name: "Apple", measurement_unit: "5kg", price: 1.99, quantity: 3, user_id: 1)
      @recipe_1 = Recipe.create(name: "Creamy White Chili", preparation_time: "12:05", cooking_time: "6:45", description: "Lorem ipsum dolor sit", user_id: @user_1)
      @recipes = Recipe.includes(:recipe_foods)
      @first_ingredient = RecipeFood.create(recipe_id: @recipe_1.id, food_id: @food_1.id, quantity: 1)
    end
    
    it 'Can see recipe name' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content('Creamy White Chili')
      end
    end

    it 'Can see recipe description' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content('Lorem ipsum dolor sit')
      end
    end

    it 'Can see recipe preparation time' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content('12:05')
      end
    end

    it 'Can see recipe cooking time' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content('6:45')
      end
    end

    it 'Can see recipe ingredients' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content(@first_ingredient.food.name)
      end
    end

    it 'Can see a button that lets a user add new ingredients' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        expect(page).to have_content('Add New Ingredient')
      end
    end

    it 'Can click on add new ingredient, to be redirected to a form to add new ingredient' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        click_link "Add New Ingredient"
        expect(page.current_url).to match new_recipe_recipe_food_path(recipe.id)
      end
    end

    it 'Can click on Generate Shopping List, to be redirected to a page with a shopping list' do
      @recipes.each do |recipe|
        visit recipe_path(recipe.id)
        click_link "Generate Shopping List"
        expect(page.current_url).to match general_shopping_lists_path
      end
    end
  end

end