class ProductsController < ApplicationController
  impressionist :actions=>[:show]
  before_action :find_product, except: [:index, :new, :create, :category]

  def new
    @product = Product.new
  end

  def show
    impressionist(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was deleted"
  end

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 3)
  end

  def category
    if params[:category] == "DESC"
      @products = Product.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
    elsif params[:category] == "ASC"
      @products = Product.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 3)
    elsif params[:category] == "small"
      @products = Product.all.order("price ASC").paginate(:page => params[:page], :per_page => 3)
    elsif params[:category] == "big"
      @products = Product.all.order("price DESC").paginate(:page => params[:page], :per_page => 3)
    elsif params[:category] == "top"
      @products = Product.all.order("viewed_count ASC").paginate(:page => params[:page], :per_page => 3)
    else
      @products = Product.all.paginate(:page => params[:page], :per_page => 3)
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was updated"
    else 
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was added"
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
    params.require(:product).permit(:title, :description, :price, :avatar)
  end
end
