class SessionsController < ApplicationController
binding.pry

  def new
    @user = User.new
  end

# binding.pry

  def create
    # i need to authenticate them by password, to make sure that
    # it's the real user. if the password is right, then I can
    # log them in.

    if @user = User.find(params[:user][:name])
      if @user.password == params[:password])
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         redirect_to '/'
      end
    else
       redirect_to '/'
    end
# binding.pry
 end


  def destroy

  end





end
