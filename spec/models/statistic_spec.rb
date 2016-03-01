require 'rails_helper'

RSpec.describe Statistic, type: :model do
  it {should belong_to(:player)}
  it {should belong_to(:participant)}
end
