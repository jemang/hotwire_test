class CreateCommends < ActiveRecord::Migration[7.0]
  def change
    create_table :commends do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :status, default: 0
      t.text :body

      t.timestamps
    end
  end
end
