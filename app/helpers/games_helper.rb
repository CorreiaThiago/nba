module GamesHelper
  def get_games(date)
    search_string = "http://stats.nba.com/stats/scoreboardV2?DayOffset=0&LeagueID=00&gameDate=#{date}"
    game_link = URI(search_string)
    raw_data = JSON.parse(Net::HTTP.get(game_link))
    raw_data["resultSets"]
  end

  def add_games(results)
  	results[0]["rowSet"].each do |game|
  		gamedate = game[0].to_date
  		gameid = game[2]
  		homeid = game[6]
  		awayid = game[7]
  		Game.create(nbacomid: gameid, gamedate: gamedate)
  		game = find_game(gameid)
  		hometeam = find_team(homeid)
  		awayteam = find_team(awayid)
  		Participant.create(game_id: game, team_id: hometeam, homeaway: "H")
  		Participant.create(game_id: game, team_id: awayteam, homeaway: "A")
  	end
  end

  def add_points(results)
    results[1]["rowSet"].each do |game|
      gameid = Game.find_by(nbacomid: game[2]).id
      teamid = Team.find_by(nbacomid: game[3]).id
      gameteam = Participant.find_by(game_id: gameid, team_id: teamid)
      gameteam.update(points: game[21])
    end

    games = find_games(results[0]["rowSet"].first[0].to_date)

    games.each do |game|
      if game.participants.first.points < game.participants.second.points
        game.participants.first.update(winloss: "L")
        game.participants.second.update(winloss: "W")
      else
        game.participants.first.update(winloss: "W")
        game.participants.second.upate(winloss: "L")
      end
    end
  end
end
