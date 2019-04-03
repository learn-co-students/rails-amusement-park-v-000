class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  validates :name, presence: true
  validates :min_height, presence: true, :numericality => { :greater_than_or_equal_to => 0}
  validates :happiness_rating, presence: true, :inclusion => {in: 1..5}
  validates :nausea_rating, presence: true, :inclusion => {in: 1..5}
  validates :tickets, presence: true


end
