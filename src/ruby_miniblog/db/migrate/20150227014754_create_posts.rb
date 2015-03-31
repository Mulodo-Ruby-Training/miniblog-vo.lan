class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title,        limit: 200, null: false, unique: true
      t.string :description,  limit:255,  null: false, unique: true
      t.text :content,        null: false, unique: true
      t.integer :user_id,     limit: 4,   null: false 

      t.timestamps null: false
    end
  end
end
