module AttractionsHelper

  def index_page(attraction)
    if current_user.admin
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

  def show_page(attraction)

  end
end
