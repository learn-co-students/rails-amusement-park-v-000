module AttractionsHelper
		def index_link(user)
		if user.admin 
			link_to "Show #{self.name}", attraction_path(self)
		else 
			link_to "Go on #{self.name}", attraction_path(self)
		end 
	end 
end
