class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        #user.tickets < attraction.tickets ? errors[:tickets] = "You do not have enough tickets to ride the #{attraction.name}."
        #user.height < attraction.min_height ? errors[:height] = "You are not tall enough to ride the #{attraction.name}."
        if user.tickets < attraction.tickets
            errors.messages[:tickets] = " You do not have enough tickets to ride the #{attraction.name}."
        end

        if user.height < attraction.min_height
            errors.messages[:height] = " You are not tall enough to ride the #{attraction.name}"
        end
        #if self.user.tickets < self.attraction.tickets
        #     error = error + "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        #end
        #if self.user.height < self.attraction.min_height
        #    errormsg = "You are not tall enough to ride the #{self.attraction.name}."
        #    if error.empty?
        #        error = "Sorry. " + errormsg
        #    else
        #        error = error + " " + errormsg
        #    end
        #end

        if errors.empty?
            @user = User.find_by(:id => self.user.id)
            @user.update(:tickets => self.user.tickets - self.attraction.tickets,
                :happiness => self.user.happiness + self.attraction.happiness_rating,
                :nausea => self.user.nausea + self.attraction.nausea_rating)
            @user.save
            "Thanks for riding the #{attraction.name}!"
        else
            binding.pry
            error.messages.each do |m|
                puts m.key
            end
           "Sorry." + errors.messages[:tickets] + errors.messages[:height]
        end
    end
end
