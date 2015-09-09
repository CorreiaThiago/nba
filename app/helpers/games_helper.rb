module GamesHelper
  def get_games(date)
    search_string = "http://stats.nba.com/stats/scoreboardV2?DayOffset=0&LeagueID=00&gameDate=#{date}"
    game_link = URI(search_string)
    raw_data = JSON.parse(Net::HTTP.get(game_link))
    raw_data["resultSets"]
  end
end
