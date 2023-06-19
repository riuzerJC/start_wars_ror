class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :name, null: false
      t.string :diameter, null: false
      t.string :rotation_period, null: false
      t.string :orbital_period, null: false
      t.string :gravity, null: false
      t.string :population, null: false
      t.string :climate, null: false
      t.string :terrain, null: false
      t.string :surface_water, null: false

      t.timestamps
    end
  end
end
