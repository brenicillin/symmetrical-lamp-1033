# Story 3

# As a visitor,
# When I visit the items index page,
# Then I see a list of all items
# including the item's name, price, and the name of the supermarket that it belongs to
# and the count of customers that bought that item.
require 'rails_helper'

RSpec.describe 'Item Index Page' do
  before(:each) do
    @supermarket = Supermarket.create!(name: "Publix", location: "123 Main Street")
    @item_1 = @supermarket.items.create!(name: "Milk", price: 3)
    @item_2 = @supermarket.items.create!(name: "Eggs", price: 13)
    @item_3 = @supermarket.items.create!(name: "Bread", price: 5)
    @customer_1 = Customer.create!(name: "Bob")
    @customer_2 = Customer.create!(name: "Sally")
    @customer_1.items << @item_1
    @customer_1.items << @item_2
    @customer_2.items << @item_1
    @customer_2.items << @item_3
    # 1 - 1,2
    # 2 - 1,3
  end

  describe 'As a visitor' do
    it 'I can see a list of all items' do
      visit "/items"
      expect(page).to have_content("Milk")
      expect(page).to have_content("Cost USD: $3")
      expect(page).to have_content("Publix")
      expect(page).to have_content("Buyers: 2")
      expect(page).to have_content("Eggs")
      expect(page).to have_content("Cost USD: $13")
      expect(page).to have_content("Publix")
      expect(page).to have_content("Buyers: 1")
      expect(page).to have_content("Bread")
      expect(page).to have_content("Cost USD: $5")
      expect(page).to have_content("Publix")
      expect(page).to have_content("Buyers: 1")
    end
  end
end