module AttractionsHelper
  def user_level_link(attraction)
    if current_user.admin?
      link_to "Show #{attraction.name}", attraction_path(attraction.id)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction.id)
    end
  end
end
