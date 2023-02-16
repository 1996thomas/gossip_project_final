class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index,:create,:new,:edit,:destroy]
  def index
     @gossips = Gossip.all
  end
  
  def show
    @gossip = Gossip.find(params[:id])
    find_user = @gossip.user_id
    @user = User.find(find_user)
    @commentaries = Commentary.where gossip_id: @gossip.id
  end
  def edit
    @gossip = Gossip.find(params[:id])
    unless current_user.id == @gossip.user_id
      redirect_to gossip_path
    end
  end  

  def update
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user_id
      @gossip.update!(gossip_params)
    end
  end
  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.new(gossip_params)
    gossip.user = current_user
    gossip.save
    redirect_to gossip_path(gossip.id)
  end

  def destroy

    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user_id
      @gossip.destroy
      redirect_to gossip_path
    end
  end

  private
  def gossip_params
    params.require(:gossip).permit(:title,:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
