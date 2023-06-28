# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_28_234650) do
  create_table "films", force: :cascade do |t|
    t.string "title", null: false
    t.integer "episode_id", null: false
    t.text "opening_crawl", null: false
    t.string "director", null: false
    t.string "producer", null: false
    t.datetime "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films_people", id: false, force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "people_id"
    t.index ["film_id"], name: "index_films_people_on_film_id"
    t.index ["people_id"], name: "index_films_people_on_people_id"
  end

  create_table "films_planets", id: false, force: :cascade do |t|
    t.bigint "film_id"
    t.bigint "planet_id"
    t.index ["film_id"], name: "index_films_planets_on_film_id"
    t.index ["planet_id"], name: "index_films_planets_on_planet_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "birth_year", null: false
    t.string "eye_color", null: false
    t.string "gender", null: false
    t.string "hair_color", null: false
    t.string "height", null: false
    t.string "mass", null: false
    t.string "skin_color", null: false
    t.string "homeworld", null: false
    t.datetime "created", null: false
    t.datetime "edited", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string "name", null: false
    t.string "diameter", null: false
    t.string "rotation_period", null: false
    t.string "orbital_period", null: false
    t.string "gravity", null: false
    t.string "population", null: false
    t.string "climate", null: false
    t.string "terrain", null: false
    t.string "surface_water", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
