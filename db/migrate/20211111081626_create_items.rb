class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status
      t.boolean :complete, default: false
      t.integer :like_count, default: 0
      t.integer :unlike_count, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
