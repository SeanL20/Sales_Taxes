require 'spec_helper'
require_relative '../model/product_listing'

RSpec.describe "integration" do
  describe ProductListing do
    subject(:product_lists) do
    	product_lists = ProductListing.new
      return product_lists
    end

    # checks if product listing is an instance of the ProductListing class.
    it "product listing are an instances of product listing Class" do
      expect(product_lists).to be_a ProductListing
    end

    # checks if product listing products would have new product class item after calling the add_product function.
    it "products item increase" do
      expect(product_lists.products.length).to eq 0
      product_lists.add_product("book", 1, 12.49)
      expect(product_lists.products.length).to eq 1
    end

    # checks if product listing products would have new product class item after calling the add_product function.
    it "products item increase class type" do
      product_lists.add_product("book", 1, 12.49)
      expect(product_lists.products[0]).to be_a Product
    end
  end
end