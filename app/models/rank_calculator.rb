class RankCalculator
  def calculate(user1, user2, game)
    if user1.rank == user2.rank
      if game.won_by?(user1.id)
        [3,0] 
      else
        [0,3]
      end
    end
  end
end
