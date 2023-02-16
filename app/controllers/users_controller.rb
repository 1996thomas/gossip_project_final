class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
    @city = City.find_by(id: @user.city_id)
  end

  def new
    @user = User.new
    @city = City.all
  end

  def create
    @user = User.new(user_params)
    @user.save!
    redirect_to "/sessions/new"
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:password,:email,:description,:age,:city_id)
  end
end
