class SubcategoriesController < ApplicationController
  def new
  	@subcategory = Subcategory.new
  end

  def create
  	@subcategory = Subcategory.new(subcategory_params)
  	if @subcategory.save!
  		redirect_to products_path, notice: "Subcategory was added"
  	else
  		render 'new'
  	end
  end

  private

  def subcategory_params
  	params.require(:subcategory).permit(:name, :category_id)
  end
end
