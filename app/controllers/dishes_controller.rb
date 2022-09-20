class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @ingredients = Ingredients.find(params[:id])
  end


end
