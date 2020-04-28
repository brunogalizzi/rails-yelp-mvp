class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def show
    @ratings = []
    @contents = []
    @restaurant = Restaurant.find(params[:id])
    @restaurant.reviews.each do |review|
      @ratings << review.rating.to_i
      @contents << review.content
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
