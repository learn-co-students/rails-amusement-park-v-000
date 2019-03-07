module AttractionsHelper

	def index_page_admin_toggle(attraction)
		if current_user && current_user.admin?
			link_to "Show #{attraction.name}", attraction
		else
			link_to "Go on #{attraction.name}", attraction
		end
	end

end
