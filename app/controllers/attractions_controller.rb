class AttractionsController < ApplicationController
   
   def new
      if logged_in?
         if current_user.admin
            @attraction = Attraction.new
         else
            flash[:notice] = "You do not have permission to create an attraction."
            redirect_to attractions_path
         end
      else
         flash[:notice] = "You must be logged in to an admin account to access this page."
         redirect_to '/'
      end
   end
   
   def create
      @attraction = Attraction.new(attraction_params)
      @attraction.save
      redirect_to attraction_path(@attraction)
   end

   def edit
      if logged_in?
         if current_user.admin
            @attraction = Attraction.find(params[:id])
         else
            flash[:notice] = "You do not have permission to alter the attractions."
            redirect_to attractions_path
         end
      else
         flash[:notice] = "You must be logged in to an admin account to access this page."
         redirect_to '/'
      end
   end
   
   def update
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
   end
   
   def index
      if logged_in?
         @attractions = Attraction.all
         @user = current_user
      else
         flash[:notice] = "You must be logged in to see the attractions."
         redirect_to '/'
      end
   end
   
   def show
       if logged_in?
         @attraction = Attraction.find_by(id: params[:id])
         @user = current_user
         if !@attraction
            redirect_to attractions_path
         end
      else
         flash[:notice] = "You must be logged in to see the attraction."
         redirect_to '/'
      end
   end
   
   private
   
   def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets) 
   end

end