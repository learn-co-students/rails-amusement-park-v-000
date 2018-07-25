class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  validates :min_height, presence: true
  validates :nausea_rating, presence: true
  validates :happiness_rating, presence: true
  validates :tickets, presence: true
end
