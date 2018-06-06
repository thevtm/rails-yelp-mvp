class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.valid?
      @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private def review_params
    params.require(:review).permit(:restaurant, :content, :rating)
  end
end
