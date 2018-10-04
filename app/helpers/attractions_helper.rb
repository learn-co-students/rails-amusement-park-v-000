module AttractionsHelper

  def current_attraction
    @attraction ||= Attraction.find(params[:id])
  end


end
