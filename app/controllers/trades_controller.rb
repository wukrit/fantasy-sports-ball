class TradesController < ApplicationController

  def new
    @trade = Trade.new
    session[:roster_id] = params[:roster_id] if params[:roster_id]
    @opponent_roster = Roster.find(session[:roster_id])
    @own_rosters = User.find(session[:user_id]).rosters
  end

  def create

  end

  def process_trade

  end

  def destroy

  end

end
