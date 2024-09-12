module AttractionsHelper
  def admin_index_link(user)
    link_to 'New Attraction', { controller: :attractions, action: :new }, id: 'New Attraction' if user.admin == true
  end

  def attraction_detail_link(attraction)
    if current_user.admin == true
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

end
