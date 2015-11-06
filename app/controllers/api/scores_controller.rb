class Api::ScoresController < Api::ApiController
  before_action :authenticate_player!

  def index
    @scores = Score.all

    render json: @scores, status: :ok
  end

  def create
    player = current_player

    scores = player.scores

    # Forbid a same score from a same user
    if scores.where(score: params["score"], player: player).size > 0
      render json: nil, status: :bad_request
      return
    end

    @score = scores.create(score_params)

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
