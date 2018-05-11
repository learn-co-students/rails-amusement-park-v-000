module ApplicationHelper

	 def logged_in? 
  	!!session[:user_id] 
  end 

  def current_user 
  	User.find_by(id: session[:user_id])
  end 

  def is_user_admin?(user)
  	user.admin
  end 

  def navbar_links(user) 
  		link_to "Home", root_path
  	if !logged_in? 
  		link_to "Sign Up", new_user_path 
  		link_to "Login", signin_path
  	else 
  		link_to "Profile", user_path(user)
  		link_to "Logout", logout_path
  	end 
  end 
  
end
