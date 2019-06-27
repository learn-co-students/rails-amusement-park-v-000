class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params) # Create new user instance
    if @user.save # If the user instance persists to the database (that means it passes all validations)...
      session[:user_id] = @user.id # ...create a session ID for the user
      if @user.admin == false # If the user is not an admin...
        redirect_to @user, notice: 'User was successfully created.' # ...redirect the user to their show page upon account creation
      else # If the user is an admin...
        redirect_to users_path, notice: 'Admin user was successfully created.' # ...redirect the user to the user index page upon account creation
      end
    else # if the user instance does not persist to the database (meaning it failed one or more validation)...
      render :new # ...re-render the signup form
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    # TODO: This controller action is incomplete
    # If the user instance persists to the database (that means it passes all validations)...
    if @user.update(user_params)
      if @user.admin == false
        redirect_to @user, notice: 'User was successfully updated.'
      else
        redirect_to users_path, notice: 'Admin user was successfully updated.'
      end
    else
      render :edit
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
