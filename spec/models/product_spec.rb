require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'creates a product with a given category' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      @product = @category.products.create!({
        name: 'Sample Evergreen',
        description: 'This is a sample Evergreen plant',
        quantity: 1, 
        price: 22.00
      })

      expect(@product).to be_valid
    end

    it 'verifies that a product has a name' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      
      expect {
        @product = @category.products.create!(
          name: nil,
          description: 'This is a sample Evergreen plant',
          quantity: 1,
          price: 22.00
        )
      }.to raise_error(ActiveRecord::RecordInvalid) { |error|
        expect(error.record.errors.full_messages).to include("Name can't be blank")
      }
    end

    it 'verifies that a product has a price' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      
      expect {
        @product = @category.products.create!(
          name: 'Sample Evergreen',
          description: 'This is a sample Evergreen plant',
          quantity: 1,
        )
      }.to raise_error(ActiveRecord::RecordInvalid) { |error|
        expect(error.record.errors.full_messages).to include("Price can't be blank")
      }
    
    end

    it 'verifies that a product has a quantity' do 
      @category = Category.find_or_create_by! name: 'Evergreens'
      
      expect {
        @product = @category.products.create!(
          name: 'Sample Evergreen',
          description: 'This is a sample Evergreen plant',
          price: 22.00
        )
      }.to raise_error(ActiveRecord::RecordInvalid) { |error|
        expect(error.record.errors.full_messages).to include("Quantity can't be blank")
      }
    end

    it 'verifies that a product has a category' do 
      expect {
        @product = Product.create!(
          name: 'Sample Everygreen',
          description: 'This is a sample Evergreen plant',
          quantity: 1,
          price: 22.00
        )
      }.to raise_error(ActiveRecord::RecordInvalid) { |error|
        expect(error.record.errors.full_messages).to include("Category can't be blank")
      }
    end
  end
end
