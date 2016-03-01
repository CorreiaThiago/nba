require 'rails_helper'

RSpec.describe Participant, type: :model do
  it {should belong_to(:team)}
  it {should belong_to(:game)}
  it {should validate_inclusion_of(:homeaway).in_array(['H', 'A'])}
  it {should validate_inclusion_of(:winloss).in_array(['W','L'])}
  it {should validate_presence_of(:points)}
  it {should validate_numericality_of(:points).only_integer}
end
