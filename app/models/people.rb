class People < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :birth_year, :eye_color, :gender, :hair_color,
            :height, :mass, :skin_color, :homeworld,
            :created, :edited, presence: true
end
