class CreateImprests < ActiveRecord::Migration[5.1]
  def change
    create_table :imprests do |t|
      t.date :date
      t.string :item
      t.float :debit
      t.float :credit

      t.timestamps
    end
  end
end
