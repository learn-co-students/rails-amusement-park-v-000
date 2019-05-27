class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        error = ""
        if self.user.tickets < self.attraction.tickets
             error = error + "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if self.user.height < self.attraction.min_height
            errormsg = "You are not tall enough to ride the #{self.attraction.name}."
            if error.empty?
                error = "Sorry. " + errormsg
            else
                error = error + " " + errormsg
            end
        end
        if error.empty?
            @user = User.find_by(:id => self.user.id)
            @user.update(:tickets => self.user.tickets - self.attraction.tickets,
                :happiness => self.user.happiness + self.attraction.happiness_rating,
                :nausea => self.user.nausea + self.attraction.nausea_rating)
            @user.save
        else
           error
        end
    end
end
