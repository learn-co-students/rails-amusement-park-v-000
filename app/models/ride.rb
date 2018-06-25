class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride

    #accounts for user not having enough tickets
    #accounts fo user not being tall enough
    #accounts for both of the above
      if valid_tickets && valid_height
        tickets = self.user.tickets - self.attraction.tickets

        nausea =  self.attraction.nausea_rating
        self.user.update(tickets: tickets, nausea: nausea)
      else
        puts 'Sorry'
      end
    #updates ticket number
    #updates user's nausea to
    #updates users's mood to sad
  end

  def valid_tickets
    !!(self.user.tickets >= self.attraction.tickets)
  end

  def valid_height
    !!(self.user.height >= self.attraction.min_height)
  end


end
