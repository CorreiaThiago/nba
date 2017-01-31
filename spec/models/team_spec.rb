require 'rails_helper'

RSpec.describe Team, type: :model do
	it {should validate_presence_of(:division)}	
	it {should belong_to(:division)}
	it {should validate_uniqueness_of(:abbreviation).case_insensitive}
	it {should validate_uniqueness_of(:nickname).case_insensitive}
	it {should validate_uniqueness_of(:nbacomid)}
	it {should have_many(:games)}
	it {should have_many(:participants)}
	it {should have_many(:statistics)}

  scenario "It should have the right amount of teams" do
    expect(Team.count).to eq 30
  end

  context "Evaluating team values" do
    let(:team) {Team.find_by(abbreviation: "PHI")}
    before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }


    scenario "The record method returns the the wins and losses and win percentage" do
      x = Team.find_by(abbreviation: "OKC").record
      expect(x[:pct]).to eq 0.647
      expect(x[:record]).to eq "11-6"
    end

    scenario "The Philadelphia Seventy-Sixers two point percentage is calculated properly" do
      expect(team.statistics.averages("twos")).to be_within(0.001).of(46.01)
    end

    scenario "The Seventy-Sixers three point percentage is caculated properly" do
      expect(team.statistics.averages("threes")).to be_within(0.001).of(31.85)
    end

    scenario "The Seventy-Sixers free throw percentage is claculated properly" do
      expect(team.statistics.averages("frees")).to be_within(0.001).of(71.35)
    end
  end
end
