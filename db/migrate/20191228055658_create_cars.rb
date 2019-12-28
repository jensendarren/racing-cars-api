class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :car_slug
      t.integer :max_speed

      t.timestamps
    end
  end
end
