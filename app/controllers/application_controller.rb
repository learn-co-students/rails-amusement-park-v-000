class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 

   def getUser
	if session[:user_id].nil? 
		nil 
	else 
		User.find(session[:user_id])
	end
   end 
  
   
end
