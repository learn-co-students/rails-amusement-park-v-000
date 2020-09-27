module AttractionsHelper
  def form_button_text
    @attraction.persisted? ? "Update Attraction" : "Create Attraction"
  end
end
