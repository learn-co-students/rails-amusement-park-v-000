class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
    attr_accessor :message
    def take_ride
        can_i_ride? ? ride! : sorry!
    end

    def can_i_ride?
        @all_clear = true
        ticket_check
        height_check
        @all_clear
    end

    def ticket_check
        if user.tickets < attraction.tickets
            update_message("Sorry. You do not have enough tickets to ride the #{attraction.name}.")
            @all_clear = false
        end
    end

    def height_check
        if user.height < attraction.min_height
            update_message("Sorry. You are not tall enough to ride the #{attraction.name}.")
            @all_clear = false
        end
    end

    def update_message(message)
        @message.nil? ? @message = message : @message += " #{message.gsub("Sorry. ", "")}"
    end

    def ride!
        update_user
        update_message("Thanks for riding the #{attraction.name}!")
    end

    def sorry!
        @message
    end

    def update_user
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end
end
