class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :car_slug, null: false
      t.integer :max_speed

      t.timestamps
    end

    add_index :cars, :car_slug, unique: true
  end
end
