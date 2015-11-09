class ProductsController < ApplicationController
  impressionist :actions=>[:show]
  before_action :find_product, except: [:index, :new, :create]
  def new
    @product = Product.new
  end

  def show
    impressionist(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 2)
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else 
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else 
      render 'new'
    end
  end

  def edit
  end

  private

  def find_product
     @product = Product.friendly.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
