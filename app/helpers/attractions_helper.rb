module AttractionsHelper

  def add_new_attraction(user)
    if user.admin
      link_to("New Attraction", new_attraction_path)
    end
  end

  def show_or_go_attraction(user, attraction)
    if user.admin
      link_to("Show #{attraction.name}", attraction_path(attraction))
    else
      link_to("Go on #{attraction.name}", attraction_path(attraction))
    end
  end

end
