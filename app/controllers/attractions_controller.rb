class AttractionsController < ApplicationController
  before_action :require_logged_in

  def index
    @attractions = Attraction.all
  end

end
