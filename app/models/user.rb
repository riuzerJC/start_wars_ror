class User < ApplicationRecord
  has_secure_password

  has_many :people
  has_many :planets
  has_many :films

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
