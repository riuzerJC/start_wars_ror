class People < ApplicationRecord
  has_and_belongs_to_many :planets
  accepts_nested_attributes_for :planets
  belongs_to :film


  validates :name, presence: true, uniqueness: true
  validates :birth_year, :eye_color, :gender, :hair_color,
            :height, :mass, :skin_color, :homeworld,
            :created, :edited, presence: true

  belongs_to :homeworld, class_name: 'Planet'
end
