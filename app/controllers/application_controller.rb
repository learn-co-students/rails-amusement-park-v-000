class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin?
    current_user.admin
    #asking for the value of the admin attribute, you want the boolean
    #if  you do current_user.admin = "true", it will assign a string "true" as the value rather than the boolean
    #if you do current_user.admin == "true" (equality) the response will be boolean *false* because you dont have a string called "true" assigned to the admin value
    #current_user.admin will spit back the value of the .admin attribute which is *true* if this person is an admin
  end


  def current_user
    @current_user ||= User.find(session[:user_id])
    #saves you a db call if you already have a value in @current_user
  end

end
