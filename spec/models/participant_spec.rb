require 'rails_helper'

RSpec.describe Participant, type: :model do
  it {should belong_to(:team)}
  it {should belong_to(:game)}

  let(:test_case) { JSON.parse(File.read('spec/json_tests/games_test.json'))["resultSets"]}

  scenario "Adding the participants" do
  	expect {Game.add_games(test_case) }.to change{ Participant.count }.by(10)
  end
end

