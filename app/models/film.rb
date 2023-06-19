class Film < ApplicationRecord
  has_and_belongs_to_many :planets

  validates :title, presence: true, uniqueness: true
  validates :episode_id, presence: true, uniqueness: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true
end

