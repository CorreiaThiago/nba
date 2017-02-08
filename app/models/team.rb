class Team < ActiveRecord::Base
  belongs_to :division
  has_many :participants	
  has_many :games, through: :participants
  has_many :statistics, through: :participants
  validates :nbacomid, uniqueness: true
  validates :division, presence: true
  validates :abbreviation, uniqueness: {case_sensitive: false}
  validates :nickname, uniqueness: {case_sensitive: false}


  def record
    outcomes = self.participants.pluck(:winloss)
    wins = outcomes.count("W")
    losses = outcomes.length - wins
    {record: "#{wins}-#{losses}", pct: (wins/outcomes.length.to_f).round(3)}
  end
end
