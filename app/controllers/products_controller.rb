class ProductsController < ApplicationController
  def index
    @products = Product.all
    @recentProducts = Product.three_most_recent
    @mostReviewed = Product.most_reviews
    @local = Product.local
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path(@product)
    else
      render :new
    end
  end

  private
   def product_params
    params.require(:product).permit(:name, :country_of_origin, :cost)
   end
end
