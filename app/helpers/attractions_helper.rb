module AttractionsHelper

  def attraction_list_item(attraction)
    current_user.admin ? (link_to "Show #{attraction.name}", attraction_path(attraction)) : (link_to "Go on #{attraction.name}", attraction_path(attraction))
  end
end
