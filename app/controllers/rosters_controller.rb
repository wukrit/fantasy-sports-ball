class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy]

  def new
    @roster = Roster.new
    @players = Player.all
  end

  def create
    byebug
    @roster = Roster.create(team_name: roster_params(:team_name), user_id: session[:user_id])
    

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

end
