class Product < ActiveRecord::Base
	validates_numericality_of :price

	extend FriendlyId
  	friendly_id :title, use: :slugged
end
