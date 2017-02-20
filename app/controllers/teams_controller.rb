class TeamsController < ApplicationController
  def standings
  	@eastern = Hash.new
  	@standingsdate = Game.last.gamedate_display
  	Division.east.order(:name).each do |division|
  		@eastern[division.name] = []
  		division.teams.each do |team|
  			@eastern[division.name] << team.record
  		end
      @eastern[division.name].sort_by!{|hash| hash[:pct]}.reverse!
      firstplace = @eastern[division.name][0]
      firstplace[:gb] = "--"
      firstwins = firstplace[:wins]
      firstlosses = firstplace[:losses]
      i = 1
      while i < @eastern[division.name].length do
        team = @eastern[division.name][i]
        teamwins = team[:wins]
        teamlosses = team[:losses]
        gamesbehind = ((firstwins-teamwins) + (teamlosses - firstlosses))/2.0
        team[:gb] = gamesbehind
        i += 1
      end
  	end
    #return @eastern
  end
end

