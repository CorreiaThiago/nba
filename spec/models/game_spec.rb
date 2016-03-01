require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should validate_uniqueness_of(:nbacomid).case_insensitive}
  it {should validate_presence_of(:gamedate)}
end
