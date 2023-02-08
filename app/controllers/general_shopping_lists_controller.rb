class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.includes(:food)
  end
end
