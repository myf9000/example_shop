class Product < ActiveRecord::Base
	validates_numericality_of :price, presence: true
	validates :title, presence: true, length: { maximum: 50 }
	validates :description, presence: true, 
							length: {
							    minimum: 20,
							    maximum: 500,
							    tokenizer: lambda { |str| str.split(/\s+/) },
							    too_short: " must have at least %{count} words",
							    too_long: " must have at most %{count} words"
							}

	extend FriendlyId
  	friendly_id :title, use: :slugged

  	is_impressionable
end
