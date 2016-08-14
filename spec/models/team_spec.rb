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

  context "Evaluating team record" do

    before { system 'psql -d nba_test -f spec/dumps/query_data_source.sql' }

    scenario "The record method returns the the wins and losses and win percentage" do
      x = Team.find_by(abbreviation: "OKC").record
      expect(x[:pct]).to eq 0.647
      expect(x[:record]).to eq "11-6"
    end
  end
end

<<<<<<< HEAD

=======
>>>>>>> 25e2f414025bd3f405a77215085d22fc07f04e33
