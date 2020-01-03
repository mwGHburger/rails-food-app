class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(strong_restaurant_params)
        # connect restaurant to user
        @restaurant.user = current_user
        if @restaurant.save
            redirect_to restaurants_path
        else
            render :new
        end
    end

    private

    def strong_restaurant_params
        params.require(:restaurant).permit(:name, :address, :cuisine, :description)
    end
end
