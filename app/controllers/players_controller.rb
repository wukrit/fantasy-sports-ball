class PlayersController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @player = Player.find(params[:id])
  end
end
