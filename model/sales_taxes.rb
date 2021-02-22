require_relative 'product_listing'
require 'csv'

class SalesTaxes
	attr_accessor :product_listing

	def initialize
		@product_listing = nil
	end

	def input_file_import(input_file)
		@product_listing = ProductListing.new
		CSV.foreach(input_file, :headers => true) do |data|
			# Create New Product From Each Line Of The CSV.

			@product_listing.add_product(data["Product"], data["Quantity"], data["Price"])
		end

		puts "TEST"
		puts @product_listing.inspect
		puts "TEST"
	end

end