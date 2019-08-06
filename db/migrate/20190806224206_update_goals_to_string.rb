class UpdateGoalsToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :goals, :text, array: true
    add_column :customers, :goals, :string
  end
end
