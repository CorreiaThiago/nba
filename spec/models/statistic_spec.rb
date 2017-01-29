require 'rails_helper'

RSpec.describe Statistic, type: :model do
  it {should belong_to(:player)}
  it {should belong_to(:participant)}

  let(:stats) { JSON.parse(File.read('spec/json_tests/statistics_test.json'))["resultSets"][0]["rowSet"]}

  before do
    allow(Player).to receive(:get_playerstats).and_return(true)
    VCR.use_cassette("Get Games") do
      Game.get_games("2011-12-25")
    end
    Statistic.insert_player_stats(stats)
  end

  after do
    VCR.eject_cassette
  end

  scenario "21 records are added to the Statistic Table" do
    expect(Statistic.count).to eq(21)
  end



  context "Boston Celtics Statistics" do

    let(:celtics) { Team.find_by(abbreviation: "BOS").statistics }


    scenario "There should be 11 records assigned to the Boston Celtics" do
      expect(celtics.count).to eq(11)
    end

    scenario "The time played should equal 14,402" do
      expect(celtics.pluck(:time_played).sum).to eq(14402)
    end

    scenario "The twos taken by the team should total 71" do
      expect(celtics.pluck(:twostaken).sum).to eq(71)
    end

    scenario "The twos made by the team should total 37" do
      expect(celtics.pluck(:twosmade).sum).to eq(37)
    end

    scenario "The threes made by the team should total 2" do
      expect(celtics.pluck(:threesmade).sum).to eq(2)
    end

    scenario "The thress taken by the team should total 5" do
      expect(celtics.pluck(:threestaken).sum).to eq(5)
    end

    scenario "Three free throws taken by the team should total 31" do
      expect(celtics.pluck(:freestaken).sum).to eq(31)
    end

    scenario "The free throws made by the team should equal 24" do
      expect(celtics.pluck(:freesmade).sum).to eq(24)
    end

    scenario "The offensive rebounds should total 13" do
      expect(celtics.pluck(:oreb).sum).to eq(13)
    end

    scenario "The defensive rebounds should total 28" do
      expect(celtics.pluck(:dreb).sum).to eq(28)
    end

    scenario "The total assists should be 28" do
      expect(celtics.pluck(:assists).sum).to eq(28)
    end

    scenario "The total turnovers should be 18" do
      expect(celtics.pluck(:turnovers).sum).to eq(18)
    end

    scenario "The total steals should be 7" do
      expect(celtics.pluck(:steals).sum).to eq(7)
    end

    scenario "The total fouls should be 28" do
      expect(celtics.pluck(:fouls).sum).to eq(28)
    end

    scenario "The total blocks should be 5" do
      expect(celtics.pluck(:blocks).sum).to eq(5)
    end
  end

  context "New York Knicks Statistics" do
    let(:knicks) { Team.find_by(abbreviation: "NYK").statistics}

    scenario "These should be 10 records assigned to the New York Knicks" do
      expect(knicks.count).to eq(10)
    end

    scenario "Time played should total 14,400" do
      expect(knicks.pluck(:time_played).sum).to eq(14400)
    end
    scenario "The twos taken by the team should total 54" do
      expect(knicks.pluck(:twostaken).sum).to eq(54)
    end

    scenario "The twos made by the team should total 26" do
      expect(knicks.pluck(:twosmade).sum).to eq(26)
    end

    scenario "The threes made by the team should total 9" do
      expect(knicks.pluck(:threesmade).sum).to eq(9)
    end

    scenario "The thress taken by the team should total 20" do
      expect(knicks.pluck(:threestaken).sum).to eq(20)
    end

    scenario "Three free throws taken by the team should total 34" do
      expect(knicks.pluck(:freestaken).sum).to eq(34)
    end

    scenario "The free throws made by the team should equal 27" do
      expect(knicks.pluck(:freesmade).sum).to eq(27)
    end

    scenario "The offensive rebounds should total 8" do
      expect(knicks.pluck(:oreb).sum).to eq(8)
    end

    scenario "The defensive rebounds should total 23" do
      expect(knicks.pluck(:dreb).sum).to eq(23)
    end

    scenario "The total assists should be 17" do
      expect(knicks.pluck(:assists).sum).to eq(17)
    end

    scenario "The total turnovers should be 16" do
      expect(knicks.pluck(:turnovers).sum).to eq(16)
    end

    scenario "The total steals should be 9" do
      expect(knicks.pluck(:steals).sum).to eq(9)
    end

    scenario "The total fouls should be 25" do
      expect(knicks.pluck(:fouls).sum).to eq(25)
    end

    scenario "The total blocks should be 11" do
      expect(knicks.pluck(:blocks).sum).to eq(11)
    end
  end

  context "The game statistics of the first player entered" do
    let(:first) {Statistic.first}

    scenario "The first player entered shoul be a starter" do
      expect(first.starter).to eq (true)
    end

    scenario "The first player's minutes should return as 37:03" do
      expect(first.get_minutes).to eq ("37:03")
    end

    scenario "The first player's points should total 15" do
      expect(first.get_points).to eq(15)
    end

    scenario "The first player's 'doubles' should total 1" do
      expect(first.doubles).to eq (1)
    end

    scenario "The first player's Fan Duel DFS score should be 28.1" do
      expect(first.fd).to eq(28.1)
    end

    scenario "The first players's Yahoo DFS score should be 28.1" do
      expect(first.yh).to eq(28.1)
    end

    scenario "The first player's Draft Kings DFS score should be 30" do
      expect(first.dk).to eq(30)
    end
  end

  context "The game statistics of the fifth player score the Fantasy Scores properly" do
    let(:fifth) {Statistic.fifth}

    scenario "The Fan Duel game score of the fifth player should be 61.5" do
      expect(fifth.fd).to eq(61.5)
    end

    scenario "The Yahoo Game score of the fifth player should be 61.5" do
      expect(fifth.yh).to eq(61.5)
    end

    scenario "The Draft Kings game score of the fifth player should be 65.75" do
      expect(fifth.dk).to eq(65.75)
    end
  end
end
