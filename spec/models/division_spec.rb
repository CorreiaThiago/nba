require 'rails_helper'

RSpec.describe Division, type: :model do
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_presence_of(:conference)}
  it {should validate_inclusion_of(:conference).in_array(['Eastern', 'Western'])}
  it {should have_many(:teams) }
end
