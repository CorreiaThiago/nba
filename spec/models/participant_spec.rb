require 'rails_helper'

RSpec.describe Participant, type: :model do
  it {should belong_to(:team)}
  it {should belong_to(:game)}

  let(:test_case) { JSON.parse(File.read('spec/json_tests/games_test.json'))["resultSets"]}
  let(:results) {
    { "0021100001" => {home: ["NYK", "W", 106], away: ["BOS", "L", 104]},
    "0021100002" => {home: ["DAL", "L", 94], away: ["MIA", "W", 105]},
    "0021100003" => {home: ["LAL", "L", 87], away: ["CHI", "W", 88]},
    "0021100004" => {home: ["OKC", "W", 97], away: ["ORL", "L", 89]},
    "0021100005" => {home: ["GSW", "L", 86], away: ["LAC", "W", 105]} }
  }


  context "Adding the participants, after the games have been added" do
    before do
  	 Player.stub(:get_playerstats).and_return(true)
     Game.add_games(test_case)
   end

    scenario "The total number of participants should equal 10" do
		  expect(Participant.count).to eq(10)
    end

    scenario "Winners and Losers should each total five" do
      expect(Participant.loss.count).to eq(5)
      expect(Participant.win.count).to eq(5)
    end

    scenario "Home and Away Teams should each total five" do
      expect(Participant.home.count).to eq(5)
      expect(Participant.away.count).to eq(5)
    end

    scenario "Chaining Location Scopes with Win Scope" do
      expect(Participant.home.win.count).to eq(2)
      expect(Participant.away.win.count).to eq(3)
    end

    scenario "Proper Home Team assigned with win/loss and point total" do
      results.each do |key, value|
        test_game = Game.find_by(nbacomid: key)
        expect(Team.find(test_game.participants.home.pluck("team_id"))[0][:abbreviation]).to eq(value[:home][0])
        expect(test_game.participants.home.pluck("winloss")).to  eq([value[:home][1]])
        expect(test_game.participants.home.pluck("points")).to eq([value[:home][2]])
      end
    end

    scenario "Proper Away Team assigned with win/loss and point total" do
      results.each do |key, value| 
        test_game = Game.find_by(nbacomid: key)
        expect(Team.find(test_game.participants.away.pluck("team_id"))[0][:abbreviation]).to eq(value[:away][0])
        expect(test_game.participants.away.pluck("winloss")).to eq([value[:away][1]])
        expect(test_game.participants.away.pluck("points")).to eq([value[:away][2]])
      end
    end
  end
end

