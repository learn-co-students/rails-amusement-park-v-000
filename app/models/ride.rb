class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    error =[]
    error << check_ticket
    error << check_height

    if error.compact.empty?
      update_user
      "Thanks for riding the #{attraction.name}!"
    else
      "Sorry. " + error.compact.join(" ")
    end
  end

  private

  def check_ticket
    if user.tickets < attraction.tickets
      "You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  def check_height
    if user.height < attraction.min_height
      "You are not tall enough to ride the #{attraction.name}."
    end
  end

  def update_user
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
  end
end
