class ScoresController < InheritedResources::Base
  before_filter :remember_location
  before_action :authenticate_player!, except: [ :create ]

  def index
    @scores = Score.all
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

