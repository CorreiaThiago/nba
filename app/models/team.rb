class Team < ActiveRecord::Base
  belongs_to :division
  has_many :participants	
  has_many :games, through: :participants
  validates :nbacomid, uniqueness: true
end
