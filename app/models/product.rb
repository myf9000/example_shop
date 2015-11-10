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

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://res.freestockphotos.biz/pictures/9/9552-a-green-apple-on-a-dark-background-pv.jpg"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	is_impressionable :counter_cache => true, :column_name => :viewed_count, :unique => true
end
