class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  def new
    # byebug
    @roster = Roster.new
    @players = Player.all
    session[:roster_positions] ||= {}
    session[:position_search] ||= nil
    clear_session(:position_for_roster, :player_search_name, :team_filter)
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
        clear_session(:roster_positions)
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
    @roster.destroy
    redirect_to User.find(session[:user_id])
  end

  def player_search
    session[:position_for_roster] ||= params[:position_for_roster]
    session[:position_search] = params[:position_search] if params[:position_search] != nil
    session[:player_search_name] ||= params[:player_search_name]
    session[:team_filter] ||= params[:team_filter]
    @teams = Team.alphabetical
    @players = Player.where(position: session[:position_search])
    @teams = Team.where(code: @players.pluck(:team))
    # byebug
    if session[:player_search_name]
      @players = @players.where("name LIKE ?", "%#{session[:player_search_name].titleize}%")
      @teams = @teams.where(code: @players.pluck(:team))
    end

    if session[:team_filter]
      @teams = @teams.where(code: session[:team_filter])
    end

  end

  def search_clear
    clear_session(:player_search_name, :team_filter)
    redirect_to player_search_path
  end

  def add_player
    # byebug
    session[:roster_positions][session[:position_for_roster]] = params[:player_id]
    # byebug
    clear_session(:position_for_roster, :position_search, :player_search_name, :team_filter)
    redirect_to new_roster_path
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
