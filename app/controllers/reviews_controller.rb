class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Avis créé avec succès.'
    else
      render :new
    end
  end

  def edit
    @restaurant = @review.restaurant
  end

  def update
    if @review.update(review_params)
      redirect_to restaurant_path(@review.restaurant), notice: 'Avis mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(@restaurant), notice: 'Avis supprimé avec succès.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
