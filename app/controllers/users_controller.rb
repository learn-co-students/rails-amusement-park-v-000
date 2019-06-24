class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1
  def show
    @user = User.find_by(id: session[:user_id])
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  def create
    # Create new user instance
    @user = User.new(user_params)
    # If the user instance persists to the database (that means it passes all validations)...
    if @user.save
      # ...create a session ID for the user
      session[:user_id] = @user.id
      if params[:admin] == false
        redirect_to @user, notice: 'User was successfully created.'
      else
        redirect_to users_path, notice: 'Admin user was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end
end
