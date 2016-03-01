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
end
