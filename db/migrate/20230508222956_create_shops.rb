class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :city
      t.boolean :order_ahead
      t.integer :employee_count

      t.timestamps
    end
  end
end
