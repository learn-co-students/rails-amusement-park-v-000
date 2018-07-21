class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if both?
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif height?
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
     elsif tickets?
       return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
     else
       ticket_update = user.tickets - attraction.tickets
       happiness_update = user.happiness + attraction.happiness_rating
       nausea_update = user.nausea + attraction.nausea_rating
       user.update(:happiness => happiness_update, :nausea => nausea_update, :tickets => ticket_update)
       "Thanks for riding the " + "#{attraction.name}!"
     end
  end


    def height?
      user.height < attraction.min_height
    end

    def tickets?
      user.tickets < attraction.tickets
    end

    def both?
      user.tickets < attraction.tickets && user.height < attraction.min_height
    end




end
