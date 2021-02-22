require 'spec_helper'
require_relative '../model/product'

RSpec.describe "integration" do
	let(:product_json) {
    <<-JSON
      [
        { "quantity": 1, "product": "book", "price": 12.49 },
        { "quantity": 1, "product": "music cd", "price": 14.99 },
        { "quantity": 1, "product": "chocolate bar", "price": 0.85 },
        { "quantity": 1, "product": "imported bottle of perfume", "price": 27.99 },
        { "quantity": 1, "product": "bottle of perfume", "price": 18.99 },
        { "quantity": 1, "product": "packet of headache pills", "price": 9.75 },
        { "quantity": 1, "product": "box of imported chocolate", "price": 11.25 }
      ]
    JSON
  }


  describe Product do
    subject(:product_lists) do
    	product_lists = []
      products = JSON.parse(product_json)

      products.each do |product|
        # create class instance for the product.
        product_lists << Product.new(product_name: product["product"], quantity: product["quantity"], price: product["price"])
      end

      return product_lists
    end

    # checks if product list product is an instance of the Product class.
    it "product list products are an instances of product Class" do
      expect(product_lists[0]).to be_a Product
      expect(product_lists[1]).to be_a Product
      expect(product_lists[2]).to be_a Product
      expect(product_lists[3]).to be_a Product
      expect(product_lists[4]).to be_a Product
      expect(product_lists[5]).to be_a Product
      expect(product_lists[6]).to be_a Product
    end

    # checks if product has product name.
    it "has product name" do
      expect(product_lists[0].product_name).to eq "book"
      expect(product_lists[1].product_name).to eq "music cd"
      expect(product_lists[2].product_name).to eq "chocolate bar"
      expect(product_lists[3].product_name).to eq "imported bottle of perfume"
      expect(product_lists[4].product_name).to eq "bottle of perfume"
      expect(product_lists[5].product_name).to eq "packet of headache pills"
      expect(product_lists[6].product_name).to eq "box of imported chocolate"
    end

    # checks if product has quantity.
    it "product quantity" do
      expect(product_lists[0].quantity).to eq 1
      expect(product_lists[1].quantity).to eq 1
      expect(product_lists[2].quantity).to eq 1
      expect(product_lists[3].quantity).to eq 1
      expect(product_lists[4].quantity).to eq 1
      expect(product_lists[5].quantity).to eq 1
      expect(product_lists[6].quantity).to eq 1
    end

    # checks if product has price.
    it "has products price" do
      expect(product_lists[0].price).to eq 12.49
      expect(product_lists[1].price).to eq 14.99
      expect(product_lists[2].price).to eq 0.85
      expect(product_lists[3].price).to eq 27.99
      expect(product_lists[4].price).to eq 18.99
      expect(product_lists[5].price).to eq 9.75
      expect(product_lists[6].price).to eq 11.25
    end

    # checks if product is imported.
    it "has products imported" do
      expect(product_lists[0].imported?).to eq false 	# book
      expect(product_lists[1].imported?).to eq false 	# music cd
      expect(product_lists[2].imported?).to eq false	# chocolate bar
      expect(product_lists[3].imported?).to eq true 	# imported bottle of perfume
      expect(product_lists[4].imported?).to eq false 	# bottle of perfume
      expect(product_lists[5].imported?).to eq false	# packet of headache pills
      expect(product_lists[6].imported?).to eq true 	# box of imported chocolate
    end

    # checks if product is tax exempted.
    it "has products imported" do
      expect(product_lists[0].tax_exempted?).to eq true 	# book
      expect(product_lists[1].tax_exempted?).to eq false 	# music cd
      expect(product_lists[2].tax_exempted?).to eq true		# chocolate bar
      expect(product_lists[3].tax_exempted?).to eq false 	# imported bottle of perfume
      expect(product_lists[4].tax_exempted?).to eq false 	# bottle of perfume
      expect(product_lists[5].tax_exempted?).to eq true	# packet of headache pills
      expect(product_lists[6].tax_exempted?).to eq true 	# box of imported chocolate
    end
  end
end