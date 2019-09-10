class TeamsController < ApplicationController
  def index
    @teams = Team.alphabetical
  end

  def show
    @team = Team.find(params[:id])
  end

end
