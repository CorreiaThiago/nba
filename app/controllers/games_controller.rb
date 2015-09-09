class GamesController < ApplicationController
  include GamesHelper
  def index
  end

  def fetch
    @date = "#{params[:game_date][:month]}/#{params[:game_date][:day]}/#{params[:game_date][:year]}"
    @civil = Date.civil(params[:game_date][:year].to_i, params[:game_date][:month].to_i, params[:game_date][:day].to_i)
    @parsing = get_games(@civil)
  end
end
