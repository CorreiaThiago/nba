class Statistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :participant

  before_save do
    double
    fanduel
    yahoo
    draftkings
  end


  def self.insert_player_stats(statstics_array)
    statstics_array.each do |statline|
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
  end

  def get_points
    points
  end

  def get_rebounds
    rebounds
  end

  def get_minutes
    minutes_played
  end


  protected

  def self.is_starter?(input)
  	!input.empty?
  end

  def self.averages(stat)
    made = "#{stat}made".to_sym
    taken = "#{stat}taken".to_sym
    #binding.pry
    (sum(made)/sum(taken).to_f).round(4) * 100
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

  def minutes_played
    Time.at(time_played).strftime("%M:%S")
    #"#{time_played/60}:#{time_played%60}"
  end
  
  def points
    (twosmade * 2) + (threesmade * 3) + freesmade
  end


  # This method should calculate the number of doubles on a stat line - it needs to be pased the user id and only relevant statistics, points, rebounds, assists, steals, blocks as they are the only things counted in doubles
  
  def double
    self.doubles = [self.points, self.rebounds, self.blocks, self.assists, self.steals].find_all {|e| e >= 10 }.length
  end

  def fanduel
    self.fd = ((twosmade+blocks+steals) *2) + (threesmade * 3) + freesmade + (rebounds * 1.2) + (assists * 1.5) - turnovers
  end

  def yahoo
    self.yh = points + (threesmade * 0.5) + (rebounds * 1.2) + (assists * 1.5) + ((steals+blocks) * 2) - turnovers 
  end

  def draftkings
     base =  points + (threesmade * 0.5) + (rebounds * 1.25) + (assists * 1.5) + ((steals+blocks) * 2) - (turnovers * 0.5)
    if doubles == 2
      self.dk = base + 1.5
    elsif doubles > 2
      self.dk = base + 3
    else
      self.dk = base
    end
  end
end