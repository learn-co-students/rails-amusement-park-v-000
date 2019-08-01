class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Please enter all requested information."
      redirect_to new_user_path
    end
  end

  def show
    if current_user
      render :show
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.tickets >= current_attraction.tickets && current_user.height >= current_attraction.min_height
      flash[:message] = "Thanks for riding the #{current_attraction.name}!"
      current_user.update(:tickets => current_user.tickets -= current_attraction.tickets, :happiness => current_user.happiness += current_attraction.happiness_rating, :nausea => current_user.nausea += current_attraction.nausea_rating)
    elsif current_user.tickets < current_attraction.tickets && current_user.height < current_attraction.min_height
      flash[:message] = "You do not have enough tickets to ride the #{current_attraction.name}. You are not tall enough to ride the #{current_attraction.name}."
    elsif current_user.tickets < current_attraction.tickets
      flash[:message] = "You do not have enough tickets to ride the #{current_attraction.name}."
    elsif current_user.height < current_attraction.min_height
      flash[:message] = "You are not tall enough to ride the #{current_attraction.name}."
    end

    render :show
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end



end
