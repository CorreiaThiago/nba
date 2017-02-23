class TeamsController < ApplicationController
  def standings
  	@standings = Hash.new
  	@standingsdate = Game.last.gamedate_display
    conferences = Division.distinct.pluck(:conference).sort
    conferences.each do |conference_name|
      @standings[conference_name] = {}
    	Division.where(conference: conference_name).order(:name).each do |division|
    		@standings[conference_name][division.name] = []
    		division.teams.each do |team|
    			@standings[conference_name][division.name] << team.record
    		end
        @standings[conference_name][division.name].sort_by!{|hash| hash[:pct]}.reverse!
        firstplace = @standings[conference_name][division.name][0]
        firstplace[:gb] = "--"
        firstwins = firstplace[:wins]
        firstlosses = firstplace[:losses]
        i = 1
        while i < @standings[conference_name][division.name].length do
          team = @standings[conference_name][division.name][i]
          teamwins = team[:wins]
          teamlosses = team[:losses]
          gamesbehind = ((firstwins-teamwins) + (teamlosses - firstlosses))/2.0
          team[:gb] = gamesbehind
          i += 1
        end
    	end
    end
  end
end

