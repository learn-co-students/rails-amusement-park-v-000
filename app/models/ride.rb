class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    user = self.user
    attraction = self.attraction
    if user[:tickets].to_i < attraction[:tickets].to_i && user[:height].to_i < attraction[:min_height].to_i
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      elsif user[:tickets].to_i < attraction[:tickets].to_i
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     elsif user[:height].to_i < attraction[:min_height].to_i
       return "Sorry. You are not tall enough to ride the #{attraction.name}."
     else
       user.tickets = user[:tickets].to_i - attraction[:tickets].to_i
       user.nausea = user[:nausea].to_i + attraction[:nausea_rating].to_i
       user.happiness = user[:happiness].to_i + attraction[:happiness_rating].to_i
       user.save
       user

    end
  end

end
