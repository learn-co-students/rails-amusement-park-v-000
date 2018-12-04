module AttractionsHelper

    def attraction_action
        current_user.admin ?  render("edit_action") : render("ride_action") 
    end

    def admin_index_string
        current_user.admin ? "Show " : "Go on "
    end
end
