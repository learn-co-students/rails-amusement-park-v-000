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

  def go_on_this_ride_submit(user)
    if !user.admin
      submit_tag 'Go on this ride'
    end
  end

  def link_to_edit_attraction(user)
    if user.admin
      link_to("Edit Attraction", { controller: "attractions", action: "edit" })
    end
  end
end
