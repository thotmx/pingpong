class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end 

  def create
    @game = Game.new(game_params)
    if @game.save
      render :new
    else
      redirect_to root_path, notice: "The game was saved!"
    end
  end

  private

  def game_params
    params.require(:game).permit(:date_played, :opponent_id, :player_score, :opponent_score  )
  end
end
