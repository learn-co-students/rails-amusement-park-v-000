class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    #validates :user_id, :presence => true
    #validates :attraction_id, :presence => true
 
    def take_ride

        #accounts for the user not having enough ticket & user not tall enough
       if  self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
          "Cant Go On Ride"
       else
            new_ticket = self.user.tickets - self.attraction.tickets
            self.user.update(:tickets => new_ticket)
      
           new_nausea = self.user.nausea + self.attraction.nausea_rating
           self.user.update(:nausea => new_nausea)
        

        #update user happiness
         
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(:happiness => new_happiness)
            self.user.save
            "Thanks for riding #{self.attraction.name}!"
       end # close out if statment

    end
end



