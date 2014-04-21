class AddUserIdMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
  end
end
