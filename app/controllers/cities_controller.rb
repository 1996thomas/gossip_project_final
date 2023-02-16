class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @user = User.find_by city_id: @city.id
    @gossips = Gossip.where user_id: @user.id
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
