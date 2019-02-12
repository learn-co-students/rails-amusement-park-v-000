class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
  validates :min_height, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :happiness_rating, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
  validates :nausea_rating, :numericality => { only_integer: true, allow_nil: true, message: "must be a number"}
end
