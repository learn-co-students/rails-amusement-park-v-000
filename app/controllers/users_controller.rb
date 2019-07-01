class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])

    if session[:user_id] == @user.id

      if @user.happiness
        case @user.happiness when 3
          @happiness = "happy"
        when 2
          @happiness = "sad"
        else
          @happiness = "unknown"
        end
      end

      # if flash[:notice]
        
      # end
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:user][:user_id])
    attraction = Attraction.find(params[:user][:attraction_id])

    @user.update(tickets: (@user.tickets - attraction.tickets), happiness: (@user.happiness - attraction.happiness_rating))

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "user deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
