class Team < ActiveRecord::Base
  belongs_to :division
  has_many :participants	
  has_many :statitics
  has_many :players, through: :statistics
  validates :nbacomid, uniqueness: true
end
