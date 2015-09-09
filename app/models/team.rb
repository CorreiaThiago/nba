class Team < ActiveRecord::Base
  belongs_to :division
  validates :nbacomid, uniqueness: true
end
