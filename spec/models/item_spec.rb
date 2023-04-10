require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  it 'can count customers' do
    customer_1 = Customer.create!(name: "Bob")
    customer_2 = Customer.create!(name: "Sally")
    supermarket = Supermarket.create!(name: "Publix", location: "123 Main Street")
    item = supermarket.items.create!(name: "Milk", price: 3)

    customer_1.items << item
    customer_2.items << item

    expect(item.customer_count).to eq(2)
  end
end
