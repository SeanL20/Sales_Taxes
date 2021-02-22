require_relative 'product'

class ProductListing
	attr_accessor :products

	def initialize
		@products = []
	end

	# Creates a new product class and add into the products array of the product listing class.
	def add_product(product_name, quantity, price)
		product = Product.new(product_name: product_name, quantity: quantity, price: price)

		@products << product
	end

end