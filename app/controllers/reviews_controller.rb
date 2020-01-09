class ReviewsController < ApplicationController
    def index
        @reviews = Review.where(restaurant_id: params[:restaurant_id])
        @restaurant = Restaurant.find(params[:restaurant_id])
    end
    
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        @review = Review.new(strong_review_params)
        @restaurant = Restaurant.find(params[:restaurant_id])

        # Connecting review to restaurant
        @review.restaurant = @restaurant
        # Connecting review to user
        @review.user = current_user
        if @review.save
            # if true, @review.save will save the instance
            redirect_to restaurant_reviews_path(@restaurant)
        else
            render :new
        end
    end

    private

  def strong_review_params
    params.require(:review).permit(:comment, :rating, :profile_photo)
  end
end
