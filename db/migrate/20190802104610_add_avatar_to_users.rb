class AddAvatarToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar, :string
    add_column :customers, :avatar, :string
    add_index :attendances, [:customer_id, :date_attended]
  end
end
