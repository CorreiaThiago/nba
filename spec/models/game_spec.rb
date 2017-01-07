require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:gamedate)}
  
  let(:test_case) { JSON.parse(File.read('spec/json_tests/games_test.json'))["resultSets"]}
    scenario "Adding the games" do
    	allow(Player).to receive(:get_playerstats).and_return(true)
      expect { Game.add_games(test_case) }.to change {Game.count}.by(5)
    end
end
	