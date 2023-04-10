require 'rails_helper'

RSpec.describe 'Item Index Page' do
  before(:each) do
    test_data
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
      within "#item_#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content("Cost USD: $3")
        expect(page).to have_content("Available at: Publix")
        expect(page).to have_content("Buyers: 2")
      end
      within "#item_#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content("Cost USD: $13")
        expect(page).to have_content("Available at: Publix")
        expect(page).to have_content("Buyers: 1")
      end
      within "#item_#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content("Cost USD: $5")
        expect(page).to have_content("Available at: Publix")
        expect(page).to have_content("Buyers: 1")
      end
    end
  end
end