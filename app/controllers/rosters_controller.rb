class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  def new
    @roster = Roster.new
    @players = Player.all
  end

  def create
    if session[:user_id]
      @roster = Roster.create(team_name: roster_params(:team_name)[:team_name], user_id: session[:user_id])
      roster_player_params.each do |roster_position, player_id|
        @player = Player.find(player_id)
        RosterPlayer.create(roster_id: @roster.id, player_id: @player.id, roster_position: roster_position)
      end
      if @roster.roster_players.count != 8
        @roster.destroy
        flash[:errors] = "Cannot have duplicate players on a roster."
        redirect_to new_roster_path
      else
        redirect_to @roster.user
      end
    else
      flash[:errors] = "You must be logged in to create a roster."
      redirect_to new_roster_path
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_roster
    @roster = Roster.find(params[:id])
  end

  def roster_params(*args)
    params.require(:roster).permit(*args)
  end

  def roster_player_params
    params.require(:roster).require(:roster_player).permit(:QB1, :RB1, :RB2, :WR1, :WR2, :TE, :DEF, :K)
  end
end
