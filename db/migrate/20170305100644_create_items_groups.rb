class CreateItemsGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :items_groups do |t|
      t.string :name
      t.integer :parent_id
      t.text :description

      t.timestamps
    end
  end
end
