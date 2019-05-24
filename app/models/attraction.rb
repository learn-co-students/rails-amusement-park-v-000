class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def self.attraction_tickets
    self.tickets
  end




end
