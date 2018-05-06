class AttractionsController < ApplicationController

  def index
    @user=User.find_by(id: session[:user_id])
  end

  def new
    @attraction=Attraction.new
  end

  def create
    @attraction=Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @user=User.find_by(id: session[:user_id])

    if Attraction.find_by(id: params[:id])!=nil
      @attraction=Attraction.find_by(id: params[:id])
    else
      redirect_to attractions_path
    end
  end

  def go_on_a_ride
    @user=User.find_by(id: session[:user_id])
    @attraction=Attraction.find_by(id: params[:id])

    if @user.tickets < @attraction.tickets && @user.height < @attraction.min_height
      flash[:notice]="You are not tall enough to ride the #{@attraction.name} You do not have enough tickets to ride the #{@attraction.name}"
      redirect_to user_path(@user)
    elsif @user.tickets > @attraction.tickets
      if @user.height > @attraction.min_height
        @user.update(tickets: @user.tickets - @attraction.tickets, happiness: @user.happiness + @attraction.happiness_rating, nausea: @user.nausea + @attraction.nausea_rating)
        flash[:notice]="Thanks for riding the #{@attraction.name}!"
        redirect_to user_path(@user)
      else
        flash[:notice]="You are not tall enough to ride the #{@attraction.name}"
        redirect_to user_path(@user)
      end
    else
      flash[:notice]="You do not have enough tickets to ride the #{@attraction.name}"
      redirect_to user_path(@user)
    end
  end

  def edit
    @attraction=Attraction.find_by(id: params[:id])
  end

  def update
    @attraction=Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end
end
