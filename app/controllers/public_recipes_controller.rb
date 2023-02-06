class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true)
  end

  def show; end
end
