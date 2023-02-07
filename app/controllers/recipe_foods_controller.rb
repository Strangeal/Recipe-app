class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
    @food = Food.all
  end

  def create
    @recipe_foods = RecipeFood.new(quantity: params[:quantity], food_id: params[:food_id], recipe_id: params[:recipe_id])
    if @recipe_foods.save
      redirect_to recipe_path(params[:recipe_id])
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end
end