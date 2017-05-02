require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:gamedate)}
  
  scenario "Adding the games" do
  	allow(Player).to receive(:get_playerstats).and_return(true)
  	VCR.use_cassette("Get Games") do
  		expect{Game.get_games("2011-12-25")}.to change {Game.count}.by(5)
      expect(Game.first.gamedate_display).to eq "December 25, 2011"
  	end
  end

  context "Testinng methods with test data" do
    before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }
    scenario "The qualifying games method returns 6" do
      expect(Game.qualify).to eq 6
    end
  end
end
	