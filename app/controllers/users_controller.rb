class UsersController < ApplicationController
  before_action :authentication_required, only: [:show]
  

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
    if @user
  	 login(@user)
  	 redirect_to user_path(@user)
    else
      redirect_to users_new_path
    end
  end

  def show
    @user = User.find(params[:id])
    if params[:attraction_id]
      @attraction = Attraction.find(params[:attraction_id])
    end
  end

  def index
  end

  def update
    @user = User.find(params[:id])
    if @attraction = Attraction.find(params[:attraction_id])
     if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      flash[:message] = "You do not have enough tickets to ride the #{@attraction.name} You are not tall enough to ride the #{@attraction.name}"
        render :show
      elsif @user.height < @attraction.min_height
        flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
        render :show
      elsif @user.tickets < @attraction.tickets
        flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
        render :show
      else
        @attraction.users << @user
        @user.tickets -= @attraction.tickets
        @user.happiness = @attraction.happiness_rating
        @user.nausea += @attraction.nausea_rating
        @user.save
        flash[:message] = "Thanks for riding the #{@attraction.name}!"
        render :show
      end
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :happiness, :nausea, :height, :password, :tickets, :admin)
  end
end
