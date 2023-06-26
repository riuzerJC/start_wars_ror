class Film < ApplicationRecord
  has_and_belongs_to_many :planets
  accepts_nested_attributes_for :planets
  has_one :people

  validates :title, presence: true, uniqueness: true
  validates :episode_id, presence: true, uniqueness: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true
end

