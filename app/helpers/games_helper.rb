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
  
  def update_participants(results)
    #This method will update the total points and win or loss for each game participant, and add player data
    #It accesses a different row of the JSON

    #This First each adds the points to each participant from the JSON
    results[1]["rowSet"].each do |game|
      gameid = Game.find_by(nbacomid: game[2]).id
      teamid = Team.find_by(nbacomid: game[3]).id
      gameteam = Participant.find_by(game_id: gameid, team_id: teamid)
      gameteam.update(points: game[21])
    end

    games = Game.where("gamedate = ?", results[0]["rowSet"].first[0].to_date)

    ##This second each determines which team was the winner or the loser of the appropriate game
    games.each do |game|
      if game.participants.first.points < game.participants.second.points
        game.participants.first.update(winloss: "L")
        game.participants.second.update(winloss: "W")
      else
        game.participants.first.update(winloss: "W")
        game.participants.second.update(winloss: "L")
      end
      get_playerstats(game)
      #process box score here
      #run get boxscore information for players right here since you have the game id and the participants set up already?
    end
  end

  def get_playerstats(game)
    search_string ="http://stats.nba.com/stats/boxscoretraditionalv2?EndPeriod=10&EndRange=28800&GameID=#{game}&RangeType=2&Season=2014-15&SeasonType=Regular+Season&StartPeriod=1&StartRange=0"
    boxscore_link = URI(search_string)
    boxscore = JSON.parse(Net::HTTP.get(boxscore_link))
    boxscore["resultSets"][0]
  end

  def get_player(player_id)
    search_string = "http://stats.nba.com/stats/commonplayerinfo?LeagueID=00&PlayerID=#{player_id}"
    player_link = URI(search_string)
    player_info = JSON.parse(Net::HTTP.get(player_link))
    player_info["resultSets"][0]["rowSet"][0]
  end

  def get_height(player_height)
    feet = player_height.split("-").to_i * 12
    inches = player_height.split("-").to_i
    feet + inches
  end



  def checkplayer(player_id)
    unless Player.exists?(nbacomid: player_id)
      player_info = get_player(player_id)
      height = get_height(player_info[10])
      nbacomid = player_info[0]
      fname = player_info[1]
      lname = player_info[2]
      birthdate = player_info[6].to_date
      school = player_info[7]
      country = player_info[8]
      position = player_info[14]
      rookie_year = player_info[22]
      Player.create(nbacomid: nbacomid, fname: fname, lname: lname, birthdate: birthdate, school: school, country: country, height: height, position: position, rookie_year: rookie_year)
    end
  end
  def get_playerstats
    #run a script to check the player

end
