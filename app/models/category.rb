class Category < ActiveRecord::Base
  belongs_to :products
  has_many :subcategories

  validates :name, presence: true, length: { maximum: 50 }
end
