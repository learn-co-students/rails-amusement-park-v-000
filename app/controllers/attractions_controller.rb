class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create
    @attraction = Attraction.new(
    name: params[:name],
    min_height: params[:min_height],
    tickets: params[:tickets],
    happiness_rating: params[:happiness_rating],
    nausea_rating: params[:nausea_rating])

      if @attraction.save
        redirect_to @attraction
      else
        render :new
      end
    end

  def update
      if @attraction.update(attraction_params)
        redirect_to @attraction
         render :edit
      end
    end

  def destroy
    @attraction.destroy
     redirect_to attractions_url
    end


end
