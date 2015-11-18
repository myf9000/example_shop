require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "should not save product without title" do
  	product = Product.new
	assert !product.save
  end

  #test "should report error" do
	# jakaś_niezdefiniowana_zmienna nie jest nigdzie zdefiniowana w teście
	#some_undefined_variable
	#assert true
  #end

  test "save when everythin is good" do
  	product = Product.new
  	product.title = 'alla'
  	assert_not product.save, 'Saved without a title'
    product.description = 'Test bodd' * 20
    assert_not product.save, 'Saved without a description'
    product.amount = 3
    assert_not product.save, 'Saved without an amount'
    product.condition = 'New'
    assert_not product.save, 'Saved without a condition'
    product.category_id = 1
    assert_not product.save, 'Saved without a category'
    product.subcategory_id = 1
    assert_not product.save, 'Saved without a subcategory'
    product.price = 20.0
    assert product.save, 'Save when everything is good'
  end


end
