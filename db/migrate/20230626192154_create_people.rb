class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :birth_year, null: false
      t.string :eye_color, null: false
      t.string :gender, null: false
      t.string :hair_color, null: false
      t.string :height, null: false
      t.string :mass, null: false
      t.string :skin_color, null: false
      t.string :homeworld, null: false
      t.datetime :created, null: false
      t.datetime :edited, null: false

      t.timestamps
    end
  end
end
