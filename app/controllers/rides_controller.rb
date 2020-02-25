class RidesController < ApplicationController

    def new
    end
    
    def create
       #        binding.pry
        @ride = Ride.new(params)
        @ride.take_ride
    end
end
