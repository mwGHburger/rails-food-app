class ReviewsController < ApplicationController
    def index
        @reviews = Review.where(restaurant_id: params[:restaurant_id])
    end
end
