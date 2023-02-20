class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :line
      t.string :name
      t.integer :walking_minutes
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
