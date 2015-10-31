class ScoresController < InheritedResources::Base
  before_filter :remember_location
  before_action :authenticate_player!

  def index
    @scores = Score.order(score: :desc).first(30)
  end
end
