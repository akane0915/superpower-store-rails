class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "New superpower has been saved!"
      redirect_to products_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :country)
  end
end
