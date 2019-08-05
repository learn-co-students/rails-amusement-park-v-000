class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]


    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
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
