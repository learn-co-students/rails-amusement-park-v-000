class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides
  validates :name, :tickets, :nausea_rating, :happiness_rating, :min_height, presence: true


end
