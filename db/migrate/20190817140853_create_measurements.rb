class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.float :body_weight
      t.float :hips
      t.float :upper_abs
      t.float :lower_abs
      t.float :arms
      t.float :height
      t.float :bmi
      t.references :customer

      t.timestamps
    end

    add_column :subscriptions, :paused_date, :date
  end
end
