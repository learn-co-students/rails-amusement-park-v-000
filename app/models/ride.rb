class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    #validates :user_id, :presence => true
    #validates :attraction_id, :presence => true
 
    def take_ride

        #accounts for the user not having enough ticket & user not tall enough
        

                    if  self.user.height > self.attraction.min_height && self.user.tickets > self.attraction.tickets  #= need to be true
                
                       new_ticket = self.user.tickets - self.attraction.tickets
                        self.user.update(:tickets => new_ticket)
            
                       new_nausea = self.user.nausea + self.attraction.nausea_rating
                        self.user.update(:nausea => new_nausea)

                      #update user happiness
                        new_happiness = self.user.happiness + self.attraction.happiness_rating
                        self.user.update(:happiness => new_happiness)
                        self.user.save
                        "Thanks for riding the #{self.attraction.name}!"
                    elsif self.user.height < self.attraction.min_height && self.user.tickets > self.attraction.tickets
                        # user height is lesser then attraction & user ticket is greater than attraction tickets
                        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
                    elsif self.user.height > self.attraction.min_height && self.user.tickets < self.attraction.tickets
                        # user height is greater then attraction & user ticket is less than attraction tickets

                        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
                    else
                        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
                    end
        
            

    end
      

end # end the class




