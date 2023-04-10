require 'rails_helper'

RSpec.describe 'Customer Show Page' do
  before(:each) do
    test_data
    @customer_1.items << @item_1
    @customer_1.items << @item_2
  end

  describe 'As a visitor' do
    it 'I can see a customer and their items' do
      visit "/customers/#{@customer_1.id}"
      
      expect(page).to have_content(@customer_1.name)
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
      visit "/customers/#{@customer_1.id}"
      expect(page).to_not have_content("Bread")

      within '#add_items' do
        expect(page).to have_field(:item_id)
        expect(page).to have_button("Submit")
        fill_in :item_id, with: @item_3.id
        click_button "Submit"
      end
      
      expect(page).to have_content("Bread")
    end
  end
end