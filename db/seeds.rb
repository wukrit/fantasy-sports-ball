# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Player.destroy_all
Team.destroy_all

# players_json = RestClient.get("https://www.fantasyfootballnerd.com/service/players/json/test")
# teams_json = RestClient.get("https://www.fantasyfootballnerd.com/service/nfl-teams/json/test")

# TEST API KEYS ^^
# LIVE API KEYS VV
players_json = RestClient.get("https://www.fantasyfootballnerd.com/service/players/json/5m35cuhe6n3t")
teams_json = RestClient.get("https://www.fantasyfootballnerd.com/service/nfl-teams/json/5m35cuhe6n3t")


players_array = JSON.parse(players_json)["Players"]
teams_array = JSON.parse(teams_json)["NFLTeams"]



players_array.each do |player|
  if !Player.where(api_id: player["playerId"]).exists? && player["active"] == "1"
    # set to a variable for testing purposes
    new_player = Player.create(
      api_id: player["playerId"],
      name: player["displayName"],
      jersey: player["jersey"].to_i,
      position: player["position"],
      team: player["team"],
      height: player["height"],
      weight: player["weight"].to_i,
      dob: player["dob"],
      college: player["college"]
    )
    # byebug
  end
end

teams_array.each do |team|
  Team.create(
    name: team["fullName"],
    code: team["code"]
  )
end

1
