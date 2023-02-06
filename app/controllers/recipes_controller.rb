class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipes = Recipe.find(params[:id])
    @foods = Food.all
  end
end
