class Product
	attr_accessor :product_name, :quantity, :price

	def initialize(product_name:, quantity:, price:)
		@product_name = product_name
		@quantity = quantity.to_i
		@price = price.to_f
	end

	# Add check for the product if it's imported.
	def imported?
		@product_name.include?("imported") 
	end

	# Add check for the product if it's books, food or medical product
	def tax_exempted?
		@product_name.include?("book") || @product_name.include?("chocolate") || @product_name.include?("pills")
	end

end