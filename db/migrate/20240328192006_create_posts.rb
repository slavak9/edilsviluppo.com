class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :description
      t.integer :work_id

      t.timestamps
    end
    add_index :posts, :work_id
  end
end
