class Participant < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  has_many :statistics
  has_many :players, through: :statistics
  validates_inclusion_of :homeaway, {in: %w[H A]}
  validates_inclusion_of :winloss, {in: %w[W L]}
  validates :points, presence: true, numericality: {only_integer: true}
  scope :home, -> {where(homeaway: 'H')}
  scope :away, -> {where(homeaway: 'A')}
  scope :win, -> {where(winloss: 'W')}
  scope :loss, -> {where(winloss: 'L')}
end


#    t.string   "homeaway"
#    t.string   "winloss"
#    t.integer  "points"