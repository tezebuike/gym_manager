class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :receipt_number
      t.string :mode_of_payment
      t.date :start_date
      t.date :end_date
      t.decimal :amount_paid
      t.decimal :balance
      t.decimal :discount
      t.string :status
      t.references :customer, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
