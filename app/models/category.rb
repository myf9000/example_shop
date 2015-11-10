class Category < ActiveRecord::Base
  belongs_to :products

  validates :name, presence: true, length: { maximum: 50 }
end
