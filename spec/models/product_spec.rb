require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
     # Valid save operation
     it 'saves a product with all 4 fields filled' do
      @category = Category.new({name: 'test'})
      @category.save

      @product = Product.new({
        name: 'test_product',
        price: 42,
        quantity: 7,
        category_id: Category.find_by_name('test').id
      })
      expect(@product.save).to be(true)
    end

    #No name
    it 'fails to save a product without name showing related error ' do
      @category = Category.new({name: 'test'})
      @category.save

      @product = Product.new({
        name: nil,
        price: 42,
        quantity: 7,
        category_id: Category.find_by_name('test').id
      })
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    #No price
    it 'fails to save a product without price showing related error ' do
      @category = Category.new({name: 'test'})
      @category.save

      @product = Product.new({
        name: 'test_name',
        price: '',
        quantity: 7,
        category_id: Category.find_by_name('test').id
      })
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end   

    #No quantity
    it 'fails to save a product without quantity showing related error ' do
      @category = Category.new({name: 'test'})
      @category.save

      @product = Product.new({
        name: 'test_name',
        price: 42,
        quantity: nil,
        category_id: Category.find_by_name('test').id
      })
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end  

    #No category
    it 'fails to save a product without category showing related error ' do
      @category = Category.new({name: 'test'})
      @category.save

      @product = Product.new({
        name: 'test_name',
        price: 42,
        quantity: 7,
        category_id: nil
      })
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end  

  end
end
