# Extension

# As a visitor,
# When I visit a supermarket's show page,
# Then I see a unique list of all customers that have shopped at the supermarket.
require 'rails_helper'

RSpec.describe 'Supermarket Show Page' do
  before(:each) do
    test_data
    @customer_1.items << @item_1
    @customer_1.items << @item_2
    @customer_2.items << @item_1
    @customer_2.items << @item_3
  end

  describe 'As a visitor' do
    it 'I can see a list of all customers' do
      visit "/supermarkets/#{@supermarket.id}"

      within "#customer_#{@customer_1.id}" do
        expect(page).to have_content(@customer_1.name)
      end

      within "#customer_#{@customer_2.id}" do
        expect(page).to have_content(@customer_2.name)
      end
    end
  end
end