class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    tickets_check = user.tickets >= attraction.tickets
    height_check = user.height >= attraction.min_height

    if !tickets_check && !height_check 
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. " + 
        "You are not tall enough to ride the #{attraction.name}."
    elsif !height_check
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !tickets_check
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating

      attraction.total_users += 1

      user.save
      attraction.save

      "Thanks for riding the #{attraction.name}!"
    end
  end

end
