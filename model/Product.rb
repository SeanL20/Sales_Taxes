class Product
	attr_accessor :product_name, :quality, :price

	def initialize(product_name:, quality:, price:)
		@product_name = product_name
		@quality = quality
		@price = price
	end

end