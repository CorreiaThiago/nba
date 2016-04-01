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

  let(:playerinfo) { JSON.parse(File.read('spec/json_tests/player_test.json'))}

  scenario "Assuming you get the right JSON the player is added properly" do
    Player.stub(:exists?).and_return(false)
    Player.stub(:get_player).and_return(JSON.parse(File.read('spec/json_tests/player_test.json'))["resultSets"][0]["rowSet"][0])
    expect{Player.checkplayer(2404)}.to change{Player.count}.by(1)
  end
end
