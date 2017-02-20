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
  	end
  end
end

