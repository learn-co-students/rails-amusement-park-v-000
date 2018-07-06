module AttractionsHelper
  def attraction_link(att)
    if current_user.admin?
      link_to "Show #{att.name}", attraction_path(att)
    else
      link_to "Go on #{att.name}", attraction_path(att)
    end
  end
  # 
  # def display_attraction(@attraction, @new_ride)
  #   # if current_user.admin?
  #   #   link_to "Edit Attraction", edit_attraction_path
  #   # else
  #   #   form_for @new_ride do |f|
  #   #     f.hidden_field :user_id, value: "#{current_user.id}"
  #   #     f.hidden_field :attraction_id, value:"#{@attraction.id}"
  #   #     f.submit "Go on this ride"
  #   #   end
  #   # end
  # end

end
