require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:gamedate)}
  
  let(:test_case) { JSON.parse(File.read('spec/json_tests/games_test.json'))["resultSets"]}
    scenario "Adding the games" do
    	allow(Player).to receive(:get_playerstats).and_return(true)
    	VCR.use_cassette("Get Games") do
    		expect{Game.get_games("2011-12-25")}.to change {Game.count}.by(5)
    	end
      #expect { Game.add_games(test_case) }.to change {Game.count}.by(5)
    end
end
	