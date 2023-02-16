

class CommentariesController < ApplicationController


  def index
    @commentaries = Commentary.all
  end

  def show
    @commentary = Commentary.find(params[:id])
  end

  def new
    @commentary = Commentary.new
  end

  def create
    @commentary = Commentary.create(commentary_params)
    redirect_to gossips_path
  end
  private
  def commentary_params
    params.require(:commentary).permit(:content)
  end
end
