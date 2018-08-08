class AttractionsController < ApplicationController
    include UsersHelper

    def index
        @attractions = Attraction.all
    end

    def new

    end

    def create

    end


    def show
        @attraction = Attraction.find_by(:id => params[:id])
        # binding.pry
        @ride = Ride.new
    end

end
