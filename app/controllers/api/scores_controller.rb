class Api::ScoresController < ApplicationController
  acts_as_token_authentication_handler_for Player, fallback: :exception

  def index
    @scores = Score.all

    render json: @scores, status: :ok
  end

  def create 
    @player = Player.find(params[:player_id])

    @score = @player.scores.create(score_params)

    if @score.present? and @score.id.present?
      render json: @score, status: :ok
    else
      render json: @score, status: :unprocessable_entity
    end
  end

  private

    def score_params
      params.require(:score).permit(:score)
    end
end
