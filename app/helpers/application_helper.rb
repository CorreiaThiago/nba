module ApplicationHelper

	def find_game(game)
    Game.find_by(nbacomid: game).id
  end

  def find_team(team)
    Team.find_by(nbacomid: team).id
  end

  def find_games(date)
  	Game.find_by(gamedate: date)
  end
end
