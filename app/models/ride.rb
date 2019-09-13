class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def new
    end

    def create
        @ride = Ride.new
    end

    def take_ride
        if @user.tickets < @ride.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            elsif
                @user.height < @ride.height 
                "Sorry. You are not tall enough to ride the #{attraction.name}."
            elsif @user.tickets < @ride.tickets && @user.height < @ride.height
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
                else
                    binding.pry
                    @user.tickets -= attraction.tickets
                    @user.happiness += attraction.happiness_rating
                    @user.nausea += attraction.nausea_rating
                end
    end

end
