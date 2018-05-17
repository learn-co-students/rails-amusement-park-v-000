module AttractionsHelper

  def not_admin_link(user)
      link_to_if(!@user.admin, "Go on #{attraction.name}", attraction_path(attraction) )
  end
end
