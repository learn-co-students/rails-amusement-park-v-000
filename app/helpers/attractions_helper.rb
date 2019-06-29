module AttractionsHelper
  def table_display(attraction)
    if current_user.admin
      "Show #{attraction.name}"
    else
      "Go on #{attraction.name}"
    end
  end
end
