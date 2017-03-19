class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.decimal :unit_sell_price
      t.string :quantity
      t.string :cash_credit
      t.integer :customer_id

      t.timestamps
    end
  end
end
