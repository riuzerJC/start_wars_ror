class Planet < ApplicationRecord
  has_and_belongs_to_many :films

  validates :name, presence: true, uniqueness: true
  validates :rotation_period, :diameter, :climate, :gravity,
            :terrain, :surface_water, :population, presence: true

end
