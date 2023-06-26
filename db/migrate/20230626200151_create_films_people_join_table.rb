class CreateFilmPeopleJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :films_people, id: false do |t|
      t.bigint :film_id
      t.bigint :people_id
    end

    add_index :films_people, :film_id
    add_index :films_people, :people_id
  end
end
