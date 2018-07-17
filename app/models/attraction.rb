class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def ticket_ride(params)
    current_user.tickets - Attraction.find(params[:attraction][:id])
  end

end
