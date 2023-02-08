class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.includes(:food, :recipe)
    @missing_ingredient = @recipe_foods.select { |ing| ing.quantity > ing.food.quantity }
    @missing_ing = @missing_ingredient.map do |c|
      {
        name: c.food.name,
        quantity: c.quantity - c.food.quantity,
        price: c.food.price * (c.quantity - c.food.quantity)
      }
    end
    @total_price = @missing_ing.map { |all_prices| all_prices[:price] }.sum
  end
end
