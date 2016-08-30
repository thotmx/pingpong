class Game < ActiveRecord::Base
  belongs_to :player, class_name: User
  belongs_to :opponent, class_name: User

  validates :player, :opponent, :date_played, 
    :player_score, :opponent_score, presence: true

  validates :player_score, :opponent_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 21 }

  validate :score_difference
  validate :winning_score

  private

  def score_difference
    if (self.player_score.to_i - self.opponent_score.to_i).abs < 2
      errors.add(:player_score, " and opponent score should have a difference greater than 2")
    end
  end

  def winning_score
    unless self.player_score == 21 or self.opponent_score == 21
      errors.add(:player_score, " and opponent score should have a winner")
    end
  end

end
