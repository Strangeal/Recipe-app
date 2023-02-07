class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    p params.inspect
    @recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description])
    @recipe.user = current_user
    return unless @recipe.save

    redirect_to recipes_path, notice: 'Recipe created successfully'
  end

  def show
    @recipes = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:food)
    # @food = Food.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, alert: 'Recipe delete successfully'
  end

  private

  def recipe_params
    params.permit(:name, :preparation_time, :cooking_time, :description)
  end
end
