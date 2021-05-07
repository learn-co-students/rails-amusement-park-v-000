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

  # POST /users
  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    # redirect_to '/' if !logged_in?
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
  end

  # DELETE /users/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end
end
