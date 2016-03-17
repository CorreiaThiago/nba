class Game < ActiveRecord::Base
	validates :nbacomid, uniqueness: {case_sensitive: false}
  validates :gamedate, presence: true
	has_many :participants, dependent: :destroy
  has_many :teams, through: :participants
  has_many :statistics, through: :participants
  

  def self.get_games(date)
    game_result = Curl.get("http://stats.nba.com/stats/scoreboardV2?DayOffset=0&LeagueID=00&gameDate=#{date}") do |http|
      http.headers['referer'] = 'http://stats.nba.com/scores/'
    end
    raw_data = JSON.parse(game_result.body)
    if raw_data["resultSets"][0]["rowSet"].count > 0 
     games = raw_data["resultSets"]
     add_games(games)
    end
  end

  private

  def self.add_games(results)
    #Adds Game info the games and Participant basics to participants
    gamedate = results[0]["rowSet"].first[0].to_date
    results[0]["rowSet"].each do |game|
      gameid = game[2]
      homeid = game[6]
      awayid = game[7]
      Game.create(nbacomid: gameid, gamedate: gamedate)
      game = Game.find_by(nbacomid: gameid).id
      hometeam = Team.find_by(nbacomid: homeid).id
      awayteam = Team.find_by(nbacomid: awayid).id
      Participant.create(game_id: game, team_id: hometeam, homeaway: "H")
      Participant.create(game_id: game, team_id: awayteam, homeaway: "A")
    end
    #Follow up with adding points totals for each participant of the game
    results[1]["rowSet"].each do |game|
      gameid = Game.find_by(nbacomid: game[2]).id
      teamid = Team.find_by(nbacomid: game[3]).id
      gameteam = Participant.find_by(game_id: gameid, team_id: teamid)
      gameteam.update_attributes(points: game[21])
    end
    #Follow up points total with determining the winner of each game
    games = Game.where("gamedate = ?", gamedate)
    games.each do |game|
      if game.participants.first.points < game.participants.second.points
        game.participants.first.update(winloss: "L")
        game.participants.second.update(winloss: "W")
      else
        game.participants.first.update(winloss: "W")
        game.participants.second.update(winloss: "L")
      end
      Player.get_playerstats(game.nbacomid)
    end
  end
end
