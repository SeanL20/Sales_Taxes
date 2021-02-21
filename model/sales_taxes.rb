require_relative 'product_listing'

class SalesTaxes
	attr_accessor :product_listing

	def initialize
		@product_listing = nil
	end

end