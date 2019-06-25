class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
  accepts_nested_attributes_for :rides

end
