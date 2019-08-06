class AddTitleToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :notes, :string
    add_column :subscriptions, :prepared_by, :string
    add_column :customers, :title, :string
    add_column :customers, :company_name, :string
    add_column :customers, :company_address, :string
    add_column :customers, :nationality, :string
    add_column :customers, :goals, :text, array: true, default: []
    remove_index :attendances, [:customer_id, :date_attended]
    add_index :attendances, [:customer_id, :date_attended], unique: true
  end
end
