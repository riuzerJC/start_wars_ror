class CreateFilmsPlanetsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :films_planets, id: false do |t|
      t.bigint :film_id
      t.bigint :planet_id
    end

    add_index :films_planets, :film_id
    add_index :films_planets, :planet_id
  end
end
