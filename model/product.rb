class Product
	attr_accessor :product_name, :quantity, :price

	def initialize(product_name:, quantity:, price:)
		@product_name = product_name
		@quantity = quantity
		@price = price
	end

end