class AttractionsController < ApplicationController

    def index
        @attractions = Attractions.all
    end

end
