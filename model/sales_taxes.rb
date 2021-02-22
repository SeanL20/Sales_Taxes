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
			# Create New Product From Each Line Of The CSV With The ProductListing add_product function.
			@product_listing.add_product(data["Product"], data["Quantity"], data["Price"])
		end
	end

	# calculate the taxes by looping through the products and check the names for the taxes.
	def calculate_taxes
		total_price = 0
		tax_amount = 0

		products = @product_listing.products

		products.each do |product|
			# get the tax percentage of the product.
			product_tax_percentage = check_tax_percentage(product)

			# gets the total product base of the price and quantity.
			total_product_price = product.price * product.quantity

			# gets the tax amount and round it up to the nearest 0.05
			tax = get_tax_amount(total_product_price, product_tax_percentage)

			# gets the total product price with tax and round it up to 2 decimal places.
			total_product_price_with_tax = total_product_price + tax

			# gets the total price of all the products with tax and round it up to 2 decimal places.
			total_price = total_price + total_product_price_with_tax

			# Get the total tax amount.
			tax_amount = tax_amount + tax

			# prints out product name, quantity and the total product price with tax.
			puts "#{product.quantity},#{product.product_name},#{'%.2f' % total_product_price_with_tax}"
		end

		# prints the tax amount.
		puts "Sales Taxes: #{'%.2f' % tax_amount}"
		# prints the total amount.
		puts "Total: #{'%.2f' % total_price}"
	end

	def check_tax_percentage(product)
		tax_percent = 0

		# check if product is imported/
		if product.imported?
			tax_percent = tax_percent + 0.05
		end

		# check if the product 
		if !product.tax_exempted?
			tax_percent = tax_percent + 0.1
		end

		# returns the tax percentage
		return tax_percent.round(2)
	end

	def get_tax_amount(product_price, tax_percent)
		if tax_percent != 0
			return ((product_price*tax_percent)*20).ceil / 20.0
		else
			return 0
		end
	end

end