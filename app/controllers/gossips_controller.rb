class GossipsController < ApplicationController
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
  end  
  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update!(gossip_params)
    redirect_to gossip_path
  end

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.create(gossip_params)
    redirect_to gossip_path(gossip.id)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossip_path

  end
  private
  def gossip_params
    params.require(:gossip).permit(:title,:content)
  end
end
