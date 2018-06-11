class SessionsController < ApplicationController
  def new

 end

def create

  @user = User.find_by(:name => params[:name])


  if @user.authenticate(params[:password])
    session[:name] = @user.name
    redirect_to @user

  else
    redirect_to '/login'

  end


end

def destroy

  if !session[:name]
       session[:name] == nil
  else
       session.delete :name
  end
   redirect_to '/login'

end
end
