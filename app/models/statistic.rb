class Statistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :team

  def self.insert_player_stats(statline)
  	player_stats = Statistic.new
  	player_stats.game_id = statline[0]
  	player_stats.team_id = statline[1]
  	player_stats.player_id = statline[4]
  	player_stats.starter = is_starter?(statline[6])
  	player_stats.time_played = get_seconds(statline[8])
  	player_stats.twostaken
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


end

# t.references :game, index: true
# t.references :team, index: true
# t.references :player, index: true
# t.boolean :starter #array lists position if starter, blank if not, test it
# t.integer :time_played #in seconds, method will be written to convert it
# t.integer :twostaken
# t.integer :twosmade
# t.integer :threestaken
# t.integer :threesmade
# t.integer :freesmade
# t.integer :freestaken
# t.integer :oreb
# t.integer :dreb
# t.integer :assists
# t.integer :turnovers
# t.integer :seals
# t.integer :blocks
# t.integer :fouls
# t.integer :plusminus
# t.timestamps null: false