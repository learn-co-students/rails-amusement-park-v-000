class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  validates :name, :min_height, :happiness_rating, :nausea_rating, :tickets, presence: true
  validates :min_height, inclusion: {in: 1..100, message: "must be between 1 and 100"}, on: :create
  validates :happiness_rating, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create
  validates :nausea_rating, inclusion: {in: 1..5, message: "must be between 1 and 5"}, on: :create
end
