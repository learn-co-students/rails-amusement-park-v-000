class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    validates :user_id, :presence => true
    validates :attraction_id, :presence => true

    def take_ride
        #accounts for the user not having enough ticket & user not tall enough
       if  self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
          "Cant Go On Ride"
        # Updates ticket number 
       elsif
            new_ticket = self.user.tickets - self.attraction.tickets
         self.new_ticket.update
       elsif
        #update Users Nausea
           new_nausea = self.user.nausea - self.attraction.nausea_rating
          self.new_nausea.update
       else

        #update user happiness
            new_happiness = self.user.happiness - self.attraction.happiness_rating
            self.new_happiness.update
       end # close out if statment

    #    note:we need to get this to the ride view page
    end
end
