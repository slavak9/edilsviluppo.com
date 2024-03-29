class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :category_id

      t.timestamps
    end
    add_index :products, :category_id
  end
end
