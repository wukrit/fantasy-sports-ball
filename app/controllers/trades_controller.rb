class TradesController < ApplicationController

  def new
    initialize_trade_vars
  end

  def create
    # byebug
    check_sessions
    if session[:received_player_id] && session[:given_player_id]
      byebug
      Trade.create!(given_player_id: session[:given_player_id], received_player_id: session[:received_player_id])
      clear_session(:given_player_id, :received_player_id, :selected_roster)
      redirect_to User.find(session[:user_id])
    else
      # byebug
      redirect_to new_trade_path
    end
  end

  def process_trade
    @trade = Trade.find(params[:trade_id])
    handle_trade_response
    @trade.destroy
    redirect_to User.find(session[:user_id])
  end

  def destroy

  end

  private

  def initialize_trade_vars
    @trade = Trade.new
    session[:roster_id] = params[:roster_id] if params[:roster_id]
    @opponent_roster = Roster.find(session[:roster_id])
    @own_rosters = User.find(session[:user_id]).rosters
    @own_roster = Roster.find(session[:selected_roster]) if session[:selected_roster]
    @button_text = session[:selected_roster] ? "Submit Trade" : "Use this Roster"
  end

  def check_sessions
    session[:received_player_id] = params[:trade][:received_player_id] if params[:trade][:received_player_id]
    session[:selected_roster] = params[:roster][:selected_roster] if params[:roster][:selected_roster]
    session[:given_player_id] = params[:trade][:given_player_id] if params[:trade][:given_player_id]
  end

  def handle_trade_response
    if params[:trade_response] == "accept"
      @trade.commit_trade
      flash[:errors] = "The trade was accepted"
    else
      flash[:errors] = "The trade was declined"
    end
  end

end
