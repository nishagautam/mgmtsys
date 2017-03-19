class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.integer :bill_no
      t.integer :fiscal_year_id
      t.date :purchases_date
      t.decimal :total
      t.decimal :discount
      t.decimal :tax

      t.timestamps
    end
  end
end
