module AttractionsHelper

  def not_admin_link(user,attraction)
    if !user.admin
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

  def admin_link(user,attraction)
    if user.admin
      link_to "Show #{attraction.name}", attraction_path(attraction)
    end
  end

  def new_attraction_link(user)
    if user.admin
      link_to "New Attraction", { controller: "attractions", action: "new" }
    end

  end
end
