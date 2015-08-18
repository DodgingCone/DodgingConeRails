class ScoresController < InheritedResources::Base
  before_action :authenticate_player!

  def index
    @scores = Score.all
  end

  #def create 
    #@player = Player.find(params[:player_id])

    #@score = @player.scores.create(score_params)
  #end

  private

    def score_params
      params.require(:score).permit(:score, :player)
    end
end

