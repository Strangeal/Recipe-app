class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully'
    else
      render :new, alert: 'Sorry an error occured. Please try again'
    end
  end

  def show
    @recipes = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, alert: 'Recipe delete successfully'
  end

  private

  def recipe_params
    params.permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
