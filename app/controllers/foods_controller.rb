class FoodsController < ApplicationController
  def index
    @foods = Food.includes(:user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
      if @food.save
        redirect_to root_path
      else
        render :new, alert: 'Sorry an error occured. Please try again'
      end
  end

  private
  def food_params
    params.permit(:name, :measurement_unit, :price, :quantity)
  end
end
