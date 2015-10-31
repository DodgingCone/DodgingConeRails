class Api::ScoresController < Api::ApiController
  before_action :authenticate_player!

  def index
    @scores = Score.all

    render json: @scores, status: :ok
  end

  def create
    @player = current_player

    @score = @player.scores.create(score_params)

    if @score.present? and @score.id.present?
      render json: @score, status: :created
    else
      render json: @score, status: :unprocessable_entity
    end
  end

  private

    def score_params
      params.permit(:score)
    end
end
