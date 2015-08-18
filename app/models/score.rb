class Score < ActiveRecord::Base
  belongs_to :player

  validates :player_id, presence: true
  validates :score, presence: true
end
