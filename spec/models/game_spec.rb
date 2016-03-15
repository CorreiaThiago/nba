require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:gamedate)}

  let(:test_case) { JSON.parse(File.read('spec/json_tests/games_test.json'))["resultSets"]}

    scenario "Adding the games" do
      expect { Game.add_games(test_case) }.to change {Game.count}.by(5)
    end

    scenario "Adding the participants" do
      expect { Game.add_games(test_case) }.to change {Participant.count}.by(10)
    end
end
