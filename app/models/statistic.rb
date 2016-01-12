class Statistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :participant

  def self.insert_player_stats(statline)
  	player_stats = Statistic.new
  	game_id = Game.find_by(nbacomid: statline[0])
  	team_id = Team.find_by(nbacomid: statline[1])
  	player_stats.player = Player.find_by(nbacomid: statline[4])
    player_stats.participant = Participant.find_by(game_id: game_id, team_id: team_id)
  	player_stats.starter = is_starter?(statline[6])
  	player_stats.time_played = get_seconds(statline[8])
  	player_stats.twosmade = statline[9] - statline[12]
    player_stats.twostaken = statline[10] - statline[13]
    player_stats.threesmade = statline[12]
    player_stats.threestaken= statline[13]
    player_stats.freesmade = statline[15]
    player_stats.freestaken = statline[16]
    player_stats.oreb = statline[18]
    player_stats.dreb = statline[19]
    player_stats.assists = statline[21]
    player_stats.steals = statline[22]
    player_stats.blocks = statline[23]
    player_stats.turnovers = statline[24]
    player_stats.fouls = statline[25]
    player_stats.plusminus = statline[27]
    player_stats.save
  end

  private

  def self.is_starter?(input)
  	!input.empty?
  end

  def self.get_seconds(input)
  	time_array = input.split(":")
  	minutes = time_array[0].to_i * 60
  	seconds = time_array[1].to_i
  	minutes + seconds
  end

  def rebounds
    oreb + dreb
  end

  def points
    (twosmade * 2) + (threesmade * 3) + freesmade
  end

  def doubles(gamestats)
    doubles = 0
    gamestats.each do |statistic|
      if statitsic > 9
        doubles += 1
      end
    end
    if doubles < 2
      exit
    elsif doubles == 2
      gamesstats.doubles = 2
    else
      gamestats.doubles = 3
    end
    gamestats.save
  end

  def fanduel
    ((twosmade+blocks+steals) *2) + (threesmade * 3) + freesmade + (rebounds * 1.2) + (assists * 1.5) - turnovers
  end

  def yahoo
    points + (threesmade * 0.5) + (rebounds * 1.2) + (assists * 1.5) + ((steals+blocks) * 2) - turnovers 
  end

  def draftkings
    #Need to get double and triple doubles in here
  end

end