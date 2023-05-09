class CreatePies < ActiveRecord::Migration[7.0]
  def change
    create_table :pies do |t|
      t.string :name
      t.string :type
      t.boolean :wholesale
      t.integer :bake_time
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
