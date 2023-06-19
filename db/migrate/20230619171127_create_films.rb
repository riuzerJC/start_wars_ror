class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.integer :episode_id, null: false
      t.text :opening_crawl, null: false
      t.string :director, null: false
      t.string :producer, null: false
      t.datetime :release_date, null: false

      t.timestamps
    end
  end
end
