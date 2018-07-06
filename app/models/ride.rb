class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if too_short && too_poor
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif too_poor
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif too_short
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      take_the_money
      make_em_sick
      make_em_smile
      user.save
    end
  end

  def too_short
    user.height < attraction.min_height
  end

  def too_poor
    user.tickets < attraction.tickets
  end

  def take_the_money
    user.tickets -= attraction.tickets
  end

  def make_em_sick
    user.nausea += attraction.nausea_rating
  end

  def make_em_smile
    user.happiness += attraction.happiness_rating
  end
end
