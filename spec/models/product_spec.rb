require 'rails_helper'
# run tests with command: bin/rspec



RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "creates valid product" do
      @category = Category.new(name: "Cactus")
      @product = Product.new(name: "Golden Barrel", price: 100, quantity: 10, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it "display name error" do
      @category = Category.new(name: "Cactus")
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "prints price error" do
      @category = Category.new(name: "Cactus")
      @product = Product.new(name: "Golden Barrel", price: "", quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "prints quantity error" do
      @category = Category.new(name: "Cactus")
      @product = Product.new(name: "Golden Barrel", price: 100, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "prints category error" do
      @product = Product.new(name: "Golden Barrel", price: 100, quantity: 10, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end