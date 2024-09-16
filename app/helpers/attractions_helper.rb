module AttractionsHelper
  def display_new_attraction_link
    if @user.admin
      link_to("/attractions/new"){"New Attraction"}
    end
  end

  def display_attraction_link(attraction)
    if @user.admin
      link_to("Show #{attraction.name}", "/attractions/#{attraction.id}")
    else
      link_to("Go on #{attraction.name}", "/attractions/#{attraction.id}")
    end
  end


  def edit_attraction
    if @user.admin
      link_to("Edit Attraction", edit_attraction_path)
    end
  end
end
