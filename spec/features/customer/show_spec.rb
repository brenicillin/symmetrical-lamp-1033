# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.
require 'rails_helper'

RSpec.describe 'Customer Show Page' do
  let(:customer) { Customer.create!(name: 'Bob') }
  let(:supermarket) { Supermarket.create!(name: 'Publix', location: '123 Main St') }
  let(:item) { Item.create!(name: 'Milk', price: 3, supermarket: supermarket) }
  
  describe 'As a visitor' do
    it 'I can see a customer and their items' do
      visit "/customers/#{customer.id}"

      expect(page).to have_content(customer.name)
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.supermarket.name)
    end
  end
end