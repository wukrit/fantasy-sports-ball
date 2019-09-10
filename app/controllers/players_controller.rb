class PlayersController < ApplicationController

  def index
    # Use cookie to store filter and search data until user clears it

    @teams = Team.alphabetical

    if params[:search_name]
      @players = Player.where("name LIKE ?", "%#{params[:search_name].titleize}%")
      # @teams = @teams.select do |team|
      #   @players.pluck(:team).include?(team.code)
      # end
      @teams = @teams.where(code: @players.pluck(:team))
    else
      @players = Player.all
    end

    if params[:filter_option]
      if params[:filter] == "position"
        @players = @players.where(position: params[:filter_option])
      else
        @teams = Team.alphabetical
        @teams = @teams.select do |team|
          team.code == params[:filter_option]
        end
      end
    end

  end

  def show
    @player = Player.find(params[:id])
  end
end
