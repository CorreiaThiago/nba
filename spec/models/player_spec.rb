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
end
