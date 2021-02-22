require 'spec_helper'
require_relative '../model/sales_taxes'

RSpec.describe "integration" do
  describe SalesTaxes do
    subject(:sales_taxes) do
    	sales_taxes = SalesTaxes.new
    	sales_taxes.product_listing = ProductListing.new
      return sales_taxes
    end

    # checks if sales taxes is an instance of the SalesTaxes class.
    it "sales taxes are an instances of SalesTaxes Class" do
      expect(sales_taxes).to be_a SalesTaxes
    end

    # checks the tax percentage for tax exempted item is zero.
    it "calculate tax percentage tax exempted" do
      sales_taxes.product_listing.add_product("book", 1, 12.49)
      expect(sales_taxes.check_tax_percentage(sales_taxes.product_listing.products[0])).to eq 0
    end

    # checks the tax percentage for not tax exempted item is 10 percent.
    it "calculate tax percentage not tax exempted" do
      sales_taxes.product_listing.add_product("music cd", 1, 14.99)
      expect(sales_taxes.check_tax_percentage(sales_taxes.product_listing.products[0])).to eq 0.1
    end

    # checks the tax percentage for imported, tax exempted item is 5 percent.
    it "calculate tax percentage imported tax exempted" do
      sales_taxes.product_listing.add_product("box of imported chocolate", 1, 14.99)
      expect(sales_taxes.check_tax_percentage(sales_taxes.product_listing.products[0])).to eq 0.05
    end

    # checks the tax percentage for imported, not tax exempted item is 15 percent.
    it "calculate tax percentage imported not tax exempted" do
      sales_taxes.product_listing.add_product("imported bottle of perfume", 1, 14.99)
      expect(sales_taxes.check_tax_percentage(sales_taxes.product_listing.products[0])).to eq 0.15
    end

    # checks get tax amount item would return an item rounded up to the nearest 0.05.
    it "calculate tax percentage imported not tax exempted" do
      expect(sales_taxes.get_tax_amount(14.99, 0.1)).to eq 1.5
    end
  end
end