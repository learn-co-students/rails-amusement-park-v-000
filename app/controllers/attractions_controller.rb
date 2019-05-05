class AttractionsController < ApplicationController

    def index
      @attractions = Attraction.all
    end


    def new
      @attraction = Attraction.new
    end



    def create
      # binding.pry
      @attraction = Attraction.create(attraction_params)
      # binding.pry
      session[:attraction_id] = @attraction.id
      # binding.pry
      redirect_to attraction_path(@attraction)
      # render :show
      # binding.pry
    end

  # something was wrong iwth the find or find by or something
  # the admin thing, needed to go in strong params in a controller


    def show
      # binding.pry
      require_login
      @attraction = Attraction.find(params[:id])
      # binding.pry

      # @user = User.find_by(session[:user_id])
    end

    def edit
      @attraction = Attraction.find(params[:id])
      # binding.pry
    end




    def update
      # binding.pry
      @attraction = Attraction.find(params[:id])
      @attraction.update(
      name: params[:attraction][:name],
      min_height: params[:attraction][:min_height],
      nausea_rating: params[:attraction][:nausea_rating],
      happiness_rating: params[:attraction][:happiness_rating],
      tickets: params[:attraction][:tickets])
      # binding.pry
      # @attraction.name = params[:name]
      redirect_to attraction_path(@attraction)
    end


    def go_on_ride
      # "hi"
      # take_ride
      # binding.pry
      ride = Ride.new
      # ride = Ride.create(
      #   attraction_id: Attraction.find_by_id(params[:id].to_i)[:id]
      # )
      # binding.pry
      ride.attraction_id = Attraction.find_by_id(params[:id].to_i)[:id]
      # binding.pry
      ride.user_id = session[:user_id]
      ride.save
      # binding.pry

      #can be @message
      @message = ride.take_ride
      # binding.pry
      # puts "Thanks for riding the #{ride.attraction.name}!"
      # redirect_to user_path(session[:user_id])

      # this adds that extra argument to the params, where it can be accessed
      # and instantiated again in the users controller. finally you can call on it
      # in the user show
      redirect_to user_path(session[:user_id], message: @message)

      # binding.pry
    end

    private

    def attraction_params(*args)
      params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets, :attraction)
    end


  end
