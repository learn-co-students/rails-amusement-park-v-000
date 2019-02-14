module AttractionsHelper

  def attraction_list_item(attraction)
    current_user.admin ? (link_to "Show #{attraction.name}", attraction_path(attraction)) : (link_to "Go on #{attraction.name}", attraction_path(attraction))
  end

  def user_action(attraction)
    if current_user.admin
      link_to "Edit Attraction", edit_attraction_path(attraction)
    else
      render 'take_ride', {attraction: attraction}
    end
  end
end
