require "test_helper"

class GameTest < ActiveSupport::TestCase
  subject { build(:game) }

  should validate_presence_of(:player)
  should validate_presence_of(:opponent)
  should validate_presence_of(:date_played)
  should validate_presence_of(:player_score)
  should validate_presence_of(:opponent_score)

  describe "validate point difference" do
    it "player score 1 point greater than opponent score" do
      game = build(:game, player_score: 21, opponent_score: 20)
      refute game.valid?
    end

    it "opponent score 1 point greater than player score"  do
      game = build(:game, player_score: 20, opponent_score: 21)
      refute game.valid?
    end

    it "opponent score equal than player score"  do
      game = build(:game, player_score: 21, opponent_score: 21)
      refute game.valid?
    end

    it "opponent score 2 point greater than player score"  do
      game = build(:game, player_score: 19, opponent_score: 21)
      assert game.valid?
    end

    it "player score 2 points greater than opponent score"  do
      game = build(:game, player_score: 21, opponent_score: 19)
      assert game.valid?
    end

    it "player score 5 points greater than opponent score"  do
      game = build(:game, player_score: 21, opponent_score: 16)
      assert game.valid?
    end
  end

  describe "valid winning score" do
    it "both scores lower than 21" do
      game = build(:game, player_score: 1, opponent_score: 6)
      refute game.valid?
    end

    it "player score equal to 21" do
      game = build(:game, player_score: 21, opponent_score: 6)
      assert game.valid?
    end

    it "opponent score equal to 21" do
      game = build(:game, player_score: 1, opponent_score: 21)
      assert game.valid?
    end


  end
end
