class CreateCustomerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_items do |t|
      t.references :item
      t.references :customer

      t.timestamps
    end
  end
end
