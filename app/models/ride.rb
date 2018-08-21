class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        disqualifiers = []

        if attraction.tickets > user.tickets
            disqualifiers << disqualifier("do not have enough tickets")
        end
        if attraction.min_height > user.height
            disqualifiers << disqualifier("are not tall enough")
        end

        if !disqualifiers.empty?
            "Sorry. " + disqualifiers.join(" ")
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating

            user.save
        end
    end

    private

    def disqualifier(are_unable_for_this_reason)
        "You #{are_unable_for_this_reason} to ride the #{attraction.name}."
    end
end
