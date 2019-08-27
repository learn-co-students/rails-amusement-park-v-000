class AttractionsController < ApplicationController

def show
    @attractions = Attraction.all
end

end
