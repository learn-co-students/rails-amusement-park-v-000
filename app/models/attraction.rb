class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def take_ride


  end 

end
