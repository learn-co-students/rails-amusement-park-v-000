class SessionsController < ApplicationController
  def new

 end

def create

  @user = User.find_by(:name => params[:user][:name])


  if @user && @user.authenticate(params[:user][:password])

    session[:user_id] = @user.id
    redirect_to @user

  else
    redirect_to signin_url

  end


end

def destroy

  session.clear
   redirect_to '/'

end
end
