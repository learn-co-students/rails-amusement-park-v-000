class AttractionsController < ApplicationController

  def index
  end

  def new
    @attraction = Attraction.new
  end


  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update

    if User.find(session[:user_id]).admin == false

      @attraction = Attraction.find(params[:id])
      @user = User.find(session[:user_id])

      if @attraction.tickets > @user.tickets && @attraction.min_height > @user.height
        session[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
      elsif @attraction.tickets > @user.tickets
        session[:message] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
      elsif @attraction.min_height > @user.height
        session[:message] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
      else
        @user.tickets = @user.tickets - @attraction.tickets
        @user.nausea = @user.nausea + @attraction.nausea_rating
        @user.happiness = @user.happiness + @attraction.happiness_rating
        @user.save
        session[:message] = "Thanks for riding the #{@attraction.name}!"
      end
      redirect_to user_path(@user)

    else
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    end

  end

  def edit
    @attraction = Attraction.find(params[:id])
  end


  def attraction_params
    params.require(:attraction).permit(:name, :password, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end



end
