class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(name: params[:name], preparation_time: params[:preparation_time],
      cooking_time: params[:cooking_time], description: params[:description], public: params[:public])
    @recipe.user = current_user
    if @recipe.save
    redirect_to recipes_path, notice: 'Recipe created successfully'
    else
      render :new, alert: 'Sorry an error occured. Please try again'
    end
  end

  def show
    @recipes = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:food)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, alert: 'Recipe delete successfully'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :descriptio, :public)
  end
end
