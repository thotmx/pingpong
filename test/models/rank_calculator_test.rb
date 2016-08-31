require "test_helper"

class RankCalculatorTest < ActiveSupport::TestCase
  describe "simple calculator" do
    it "user1 and user2 same rank" do
      player1 = create(:user)
      player2 = create(:user)
      game = create(:game, player: player1, opponent: player2, player_score: 21, opponent_score: 19) 
      rank_calculator = RankCalculator.new
      assert_equal([3,0], rank_calculator.calculate(player1, player2, game))
    end
  end
end
