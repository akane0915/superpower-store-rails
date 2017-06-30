class ProductsController < ApplicationController
  def index
    if params[:sort_by] == nil
      @products = Product.alphabetical
    else
      @products = Product.send(params[:sort_by])
    end
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
      flash[:notice] = "New super power has been saved!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Super power updated!"
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Super power destroyed! (Remember, use your super powers for good, not evil.)"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :country)
  end
end
