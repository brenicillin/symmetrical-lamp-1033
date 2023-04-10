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
    @item_3 = @supermarket.items.create!(name: "Bread", price: 5)
    @customer = Customer.create!(name: "Bob")
    @customer.items << @item_1
    @customer.items << @item_2
  end

  describe 'As a visitor' do
    it 'I can see a customer and their items' do
      visit "/customers/#{@customer.id}"
      
      expect(page).to have_content(@customer.name)
      within "#item_#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@supermarket.name)
      end
      within "#item_#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@supermarket.name)
      end
    end

    it 'I can add an item to a customer' do
      visit "/customers/#{@customer.id}"
      expect(page).to_not have_content("Bread")

      fill_in :item_id, with: @item_3.id
      click_button "Submit"

      expect(page).to have_content("Bread")
    end
  end
end