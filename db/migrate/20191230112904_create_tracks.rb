class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :surface_type
      t.string :time_zone, default: "UTC"
      t.string :country

      t.timestamps
    end
  end
end
