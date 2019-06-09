class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
       if user.tickets < attraction.tickets
            errors.messages[:tickets] = " You do not have enough tickets to ride the #{attraction.name}."
        end

        if user.height < attraction.min_height
            errors.messages[:height] = " You are not tall enough to ride the #{attraction.name}"
        end

        if errors.empty?
            @user = User.find_by(:id => self.user.id)
            @user.update(:tickets => self.user.tickets - self.attraction.tickets,
                :happiness => self.user.happiness + self.attraction.happiness_rating,
                :nausea => self.user.nausea + self.attraction.nausea_rating)
            @user.save
            "Thanks for riding the #{attraction.name}!"
        else
            if errors.messages[:tickets].empty?
                "Sorry." + errors.messages[:height]
            elsif errors.messages[:height].empty?
                "Sorry." + errors.messages[:tickets]
            else
                "Sorry." + errors.messages[:tickets] + errors.messages[:height]
            end
        end
    end
end
