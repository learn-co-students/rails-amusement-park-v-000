module AttractionsHelper

  def display_new_attraction_link
    if @user.admin
      link_to("/attractions/new"){"New Attraction"}
    end
  end


end
