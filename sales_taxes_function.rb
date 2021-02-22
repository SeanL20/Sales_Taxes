require_relative 'model/sales_taxes'

def sales_taxes_function
	# data input file.
	input_file = ARGV[0]

	# initailize a new sales tax class.
	sales_taxes = SalesTaxes.new

	sales_taxes.input_file_import(input_file)
end

sales_taxes_function