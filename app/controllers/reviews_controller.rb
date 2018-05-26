class ReviewsController < ApplicationController
  before_action :set_recipe

  def show
  end

  def new

  end

  def create
    @review = Review.create(review_params)
    if @review.save
      render json: @review, status: 201
    else
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:body, :user_id, :recipe_id)
  end
end
