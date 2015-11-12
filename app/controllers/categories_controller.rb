class CategoriesController < ApplicationController
  load_and_authorize_resource
  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save!
  		redirect_to products_path, notice: "Category was added"
  	else
  		render 'new'
  	end
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end
end
