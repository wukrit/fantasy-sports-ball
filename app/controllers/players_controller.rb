class PlayersController < ApplicationController

  def index
    @teams = Team.alphabetical
    if params[:search_name]
      @players = Player.where("name LIKE ?", "%#{params[:search_name].titleize}%")
      @teams = @teams.select do |team|
        @players.pluck(:team).include?(team.code)
      end
    else
      @players = Player.all
    end
  end

  def show
    @player = Player.find(params[:id])
  end
end
