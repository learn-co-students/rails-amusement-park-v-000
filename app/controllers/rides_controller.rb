class RidesController < ApplicationController

    def new
    end
    
    def create
       raise params.inspect
        @ride = Ride.new(params)
        @ride.take_ride
    end
end
