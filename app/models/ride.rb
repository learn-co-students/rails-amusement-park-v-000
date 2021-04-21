class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  # def initialize
  #   binding.pry
  #   @user = User.find(user_id)
  #   @attraction = Attraction.find(attraction_id)
  # end

  def rider_allowed?
    tall_enough && enough_tickets
  end

  def tall_enough
    @user = User.find(user_id)
    @attraction = Attraction.find(attraction_id)

    @user.height >= @attraction.min_height
  end

  def enough_tickets
    @user.tickets >= @attraction.tickets
  end

  def pay_fee
    @user.pay(@attraction)
  end
end
