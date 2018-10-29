class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id  #attempt to log them in.
        redirect_to user_path(@user) #this is a get request GET "/"
      else
        redirect_to root_path #show them the form.
      end
  
  end


  def show
    @user = User.find(params[:id])
    render 'users/show'
   # list out in the user / show template
  end

  private

  def user_params
  params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)

  end

end
