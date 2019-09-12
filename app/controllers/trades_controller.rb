class TradesController < ApplicationController

  def new
    @trade = Trade.new
    session[:roster_id] = params[:roster_id] if params[:roster_id]
    @opponent_roster = Roster.find(session[:roster_id])
    @own_rosters = User.find(session[:user_id]).rosters
    @own_roster = Roster.find(session[:selected_roster]) if session[:selected_roster]
  end

  def create
    # byebug
    session[:received_player_id] = params[:trade][:received_player_id] if params[:trade][:received_player_id]
    session[:selected_roster] = params[:roster][:selected_roster] if params[:roster][:selected_roster]
    session[:given_player_id] = params[:trade][:given_player_id] if params[:trade][:given_player_id]
    if session[:received_player_id] && session[:given_player_id]
      redirect_to User.find(session[:user_id])
    else
      # byebug
      redirect_to new_trade_path
    end
  end

  def process_trade

  end

  def destroy

  end

end
