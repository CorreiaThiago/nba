class Participant < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :statistics, dependent: :destroy
  has_many :players, through: :statistics
  validates_inclusion_of :homeaway, {in: %w[H A]}

  scope :home, -> {where(homeaway: 'H')}
  scope :away, -> {where(homeaway: 'A')}
  scope :win, -> {where(winloss: 'W')}
  scope :loss, -> {where(winloss: 'L')}


  def opponent
  	opponent = Participant.where("game_id =? and team_id != ?", self.game, self.team).first
  	opponent.team.nickname
  end
end


