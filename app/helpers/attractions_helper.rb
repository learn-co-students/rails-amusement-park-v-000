module AttractionsHelper

  def attraction_prompt
    current_user.admin ? "Show" : "Go on"
  end

  def edit_or_go_on_link
    if current_user.admin
      link_to 'Edit Attraction', edit_attraction_path(@attraction)
    else
      button_to 'Go on this ride', rides_path, params: {'attraction[id]' => @attraction.id}
    end
  end

end
