class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end
  
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(name: params[:attraction][:name], tickets: params[:attraction][:tickets], nausea_rating: params[:attraction][:nausea_rating], happiness_rating: params[:attraction][:happiness_rating], min_height: params[:attraction][:min_height])
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:attraction][:id])
    if params[:attraction][:name]
      @attraction.update(name: params[:attraction][:name], tickets: params[:attraction][:tickets], nausea_rating: params[:attraction][:nausea_rating], happiness_rating: params[:attraction][:happiness_rating], min_height: params[:attraction][:min_height])
      if @attraction.save
        redirect_to attraction_path(@attraction)
      else
        redirect_to edit_attraction_path(@attraction)
      end
    else
      if @attraction
        @user = User.find(current_user.id)
        if @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
          @user.tickets -= @attraction.tickets
          @user.happiness -= @attraction.happiness_rating
          @user.save
          if @user.save
            flash[:alert] = ["Thanks for riding the #{@attraction.name}!"]
            redirect_to user_path(@user)
          end
        elsif @user.height < @attraction.min_height && @user.tickets >= @attraction.tickets
          flash[:alert] = ["You are not tall enough to ride the #{@attraction.name}"]
          redirect_to user_path(@user)
        elsif @user.height >= @attraction.min_height && @user.tickets < @attraction.tickets
          flash[:alert] = ["You do not have enough tickets to ride the #{@attraction.name}"]
            redirect_to user_path(@user)
        else
          flash[:alert] = ["You are not tall enough to ride the #{@attraction.name}", "You do not have enough tickets to ride the #{@attraction.name}"]
          redirect_to user_path(@user)
        end
      end
    end
  end

end
