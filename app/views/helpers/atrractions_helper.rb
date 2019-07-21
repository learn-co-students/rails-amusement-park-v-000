# def attraction_show_link(user)
#
#   if user.admin == true
#     link_to "Edit Attraction", edit_attraction_path
#
#   else
#     form_tag('/rides') do
#
#       <input name="ride[user_id]" type="hidden" id="ride_user_id" value="<%= current_user.id %>"><br>
#       <input name="ride[attraction_id]" type="hidden" id="attraction_user_id" value="<%= @attraction.id %>"><br>
#
#       <input type="submit" value='Go on this ride'>
#
#      end
#   end
# end

# def admin_index_link(user)
#   link_to "New Attraction", new_attraction_path if user.admin == true
# end
