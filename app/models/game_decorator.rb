class GameDecorator
  def initialize(game, user)
    @game = game 
    @user = user
  end

  def date
    game.date_played
  end 

  def opponent
    if game.player_id == user.id
      game.opponent.email
    else
      game.player.email
    end
  end

  def score
    if game.player_id == user.id
      "#{game.player_score}-#{game.opponent_score}"
    else
      "#{game.opponent_score}-#{game.player_score}"
    end
  end
 
  def result
    if game.player_id == user.id
      game.win? ? "Win" : "Lose"
    else
      !game.win? ? "Win" : "Lose"
    end
  end

  private

  attr_accessor :game, :user
end
