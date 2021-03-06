class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :slug
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :gender
      t.date :date_of_birth
      t.date :date_joined
      t.string :status

      t.timestamps
    end
    add_index :customers, :slug
  end
end
