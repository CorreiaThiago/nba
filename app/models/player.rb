class Player < ActiveRecord::Base
  has_many :statistics

  def self.get_playerstats(game)
    search_string ="http://stats.nba.com/stats/boxscoretraditionalv2?EndPeriod=10&EndRange=28800&GameID=#{game}&RangeType=2&StartPeriod=1&StartRange=0"
    boxscore_link = URI(search_string)
    boxscore = JSON.parse(Net::HTTP.get(boxscore_link))
    player_game_info = boxscore["resultSets"][0]["rowSet"]
    player_game_info.each do |player|
      player_id = player[4]
      checkplayer(player_id)
      Statistic.insert_player_stats(player)
    end
  end

  private 
		def self.checkplayer(player_id)
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

    def self.get_height(player_height)
      feet = player_height.split("-")[0].to_i * 12
      inches = player_height.split("-")[1].to_i
      feet + inches
    end

    def self.get_player(player_id)
      search_string = "http://stats.nba.com/stats/commonplayerinfo?LeagueID=00&PlayerID=#{player_id}"
      player_link = URI(search_string)
      player_info = JSON.parse(Net::HTTP.get(player_link))
      player_info["resultSets"][0]["rowSet"][0]
    end    
end
