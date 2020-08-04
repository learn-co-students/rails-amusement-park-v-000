class FoodsController < ApplicationController

  def index
#   @foods = Food.all
    @foods = Food.order(business: :desc)
  end
    
  def show
    @food = Food.find(params[:id])
  end


  def new
    @food = Food.new
    @food.items.build
  end

   def edit
   @food = Food.find(params[:id])
#    @food.items.find(params[:item_1])
   end
  
  def create
    @food = Food.new(food_params)
    
    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
end
  
  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to food_path(@food)
  end

  def destroy
     Food.find(params[:id]).destroy
     redirect_to foods_url
  end
  

  private

    def set_food
       @food = Food.find(params[:id])
    end
    
   def food_params
          params.require(:food).permit( :business, :website, :rating,
                                       items_attributes: [ :id, :item_1])
    end
    
end
