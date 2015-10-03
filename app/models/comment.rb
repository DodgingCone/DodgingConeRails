class Comment < ActiveRecord::Base
  belongs_to :player
  belongs_to :score

  validates :player_id, presence: true
  validates :score_id, presence: true
  validates :body, presence: true
end
