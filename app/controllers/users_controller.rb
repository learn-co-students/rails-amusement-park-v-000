class UsersController < ApplicationController


  before_action :require_login, only: :show

  PERMISSIONS = {
    :admin => 1,
    :non_admin => 0
  }

  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]


  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      log_in(@user)
      redirect_to @user
    else
      @user.errors.full_messages.inspect
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:attraction])
    @user = User.find(params[:id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    @ride.take_ride
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def require_login
      unless logged_in?
      redirect_to '/'
      end

    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    require_login
    @user = User.find(params[:id])
  end

  def update
    user = User.find(session[:user_id])
    @ride = Ride.create(user_id: user.id, attraction_id: params[:id])
    @ride.take_ride
    if @ride.user.height < @ride.attraction.min_height && @ride.user.tickets < @ride.attraction.tickets
      flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name} You do not have enough tickets to ride the #{@ride.attraction.name}"
    elsif @ride.user.height < @ride.attraction.min_height
      flash[:notice] = "You are not tall enough to ride the #{@ride.attraction.name}"
    elsif @ride.user.tickets < @ride.attraction.tickets
        flash[:notice] = "You do not have enough tickets to ride the #{@ride.attraction.name}"
    else
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    end
      redirect_to user_path(@ride.user)
    end

     private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def require_login
      redirect_to '/' unless session.include? :user_id
    end

end
