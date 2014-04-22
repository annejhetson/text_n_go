class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.timestamps
    end
    add_column :messages, :friend_id, :integer
  end
end
