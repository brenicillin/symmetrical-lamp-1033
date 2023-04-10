# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.

# Story 2

# As a visitor,
# When I visit a customer's show page,
# Then I see a form to add an item to this customer.
# When I fill in a field with the id of an existing item,
# And I click submit,
# Then I am redirected back to the customer's show page, 
# And I see the item now listed under this customer's items.
# (You do not have to test for a sad path, for example if the ID submitted is not an existing item)
require 'rails_helper'

RSpec.describe 'Customer Show Page' do
  before(:each) do
    @supermarket = Supermarket.create!(name: "Publix", location: "123 Main Street")
    @item_1 = @supermarket.items.create!(name: "Milk", price: 3)
    @item_2 = @supermarket.items.create!(name: "Eggs", price: 13)
    @customer = Customer.create!(name: "Bob")
    @customer.items << @item_1
    @customer.items << @item_2
  end

  describe 'As a visitor' do
    it 'I can see a customer and their items' do
      visit "/customers/#{@customer.id}"
      save_and_open_page
      expect(page).to have_content(@customer.name)
      expect(page).to have_content("Milk")
      expect(page).to have_content("Eggs")
      expect(page).to have_content("Cost USD: $3")
      expect(page).to have_content("Cost USD: $13")
      expect(page).to have_content("Available at: Publix")
    end
  end
end