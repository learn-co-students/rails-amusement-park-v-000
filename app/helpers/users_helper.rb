module UsersHelper
	def isLoggedIn? 
		!session[:user_id].nil?
	end 
end
