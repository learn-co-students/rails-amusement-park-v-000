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

  def go_on_this_ride(user,attraction)
    if !user.admin
      form_tag ({controller: 'rides', action: 'create', method: 'post'}) do
        hidden_field_tag "ride[user_id], user.id"
        hidden_field_tag "ride[attraction_id], attraction.id"
        submit_tag 'Go on this ride'
      end
    end
  end

  def go_on_this_ride_submit(user)
    if !user.admin
      submit_tag 'Go on this ride'
    end
  end
end
