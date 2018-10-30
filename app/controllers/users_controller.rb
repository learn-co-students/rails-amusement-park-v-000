class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      if @user.save

        session[:user_id] = @user.id  #attempt to log them in.
        redirect_to user_path(@user) #this is a get request GET "/"
      else

        render 'users/new' #show them the form.
      end
  
  end


  def show

    if !session.include?(:user_id)
      redirect_to root_path
    else
    @user = User.find(params[:id])
    render 'users/show'
   # list out in the user / show template
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end  
  

end
