class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    t = Game.arel_table
    @games = Game.where(
      t[:player_id].eq(current_user.id).
      or(t[:opponent_id].eq(current_user.id))
    )
  end

  def new
    @game = Game.new
  end 

  def create
    @game = Game.new(game_params)
    @game.player = current_user
    if @game.save
      redirect_to root_path, notice: "The game was saved!"
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:date_played, :opponent_id, :player_score, :opponent_score)
  end
end
