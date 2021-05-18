module AttractionsHelper
  def link_to_attraction(user, attraction)
    user.admin ? "Show #{attraction.name}" : "Go on #{attraction.name}"
  end
end
