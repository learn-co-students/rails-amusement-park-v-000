module AttractionsHelper

  def link_to_attraction(attraction)
    if current_user.admin
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

end
