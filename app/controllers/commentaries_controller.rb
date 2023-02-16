class CommentariesController < ApplicationController

  def index
    @commentaries = Commentary.all

  end

  def new
    @commentary = Commentary.new
  end
  def show
    @commentary = Commentary.find(params[:id])
  end

  def create
    @commentary = Commentary.new(content: params[:content], gossip_id: params[:gossip_id], user_id: current_user.id)
    @commentary.save
    gossip = @commentary.gossip_id
    redirect_to gossip_path(gossip)
  end

  # private
  # def commentary_params
  #   params.require(:commentary).permit(:gossip_id,:content)
  # end

end
