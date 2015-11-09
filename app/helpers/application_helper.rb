module ApplicationHelper
	def set_title_of_page(page_title="")
		add = "Shopper"
		if page_title.empty?
			page_title = add
		else
			page_title = page_title+ " | " +add
		end
	end

end
