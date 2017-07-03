class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render :index
  end

  def show
    @review = Review.find(params[:id])
    render :show
  end

  def new
    @review = Review.new
    render :new
  end
end
