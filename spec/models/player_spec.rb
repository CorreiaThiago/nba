require 'rails_helper'

RSpec.describe Player, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:fname)}
  it {should validate_presence_of(:lname)}
  it {should validate_presence_of(:birthdate)}
  it {should validate_presence_of(:school)}
  it {should validate_presence_of(:country)}
  it {should validate_presence_of(:height)}
  it {should validate_numericality_of(:height).only_integer}
  it {should validate_numericality_of(:rookie_year).only_integer}

  context "With all the information filled out" do
    before do
      allow(Player).to receive(:exists?).and_return(false)
      allow(Player).to receive(:get_player).and_return(JSON.parse(File.read('spec/json_tests/player_test.json'))["resultSets"][0]["rowSet"][0])
      Player.checkplayer(2404)
    end

    scenario "One record is added to the blank database" do  
      expect(Player.count).to eq(1)
    end

    scenario "The proper information is added to the proper fields" do
      expect(Player.first.fname).to eq("Chris")
      expect(Player.first.lname).to eq("Wilcox")
      expect(Player.first.school).to eq("Maryland")
      expect(Player.first.height).to eq(82)
      expect(Player.first.country).to eq("USA")
      expect(Player.first.rookie_year).to eq(2002)
    end
  end

  context "With the school as a null value" do
    before do
      allow(Player).to receive(:exists?).and_return(false)
      allow(Player).to receive(:get_player).and_return(JSON.parse(File.read('spec/json_tests/player_test_null_school.json'))["resultSets"][0]["rowSet"][0])
      Player.checkplayer(2404)
    end

    scenario "One record is added to the blanke database" do
      expect(Player.count).to eq(1)
    end

    scenario "The School is listed as 'N/A' " do
      expect(Player.first.school).to eq("N/A")
    end
  end

  context "With the country as a null value" do
    before do
      allow(Player).to receive(:exists?).and_return(false)
      allow(Player).to receive(:get_player).and_return(JSON.parse(File.read('spec/json_tests/player_test_null_country.json'))["resultSets"][0]["rowSet"][0])
      Player.checkplayer(2404)
    end

    scenario "One record is added to the blanke database" do
      expect(Player.count).to eq(1)
    end

    scenario "The School is listed as 'N/A' " do
      expect(Player.first.country).to eq("Unknown")
    end
  end
end
