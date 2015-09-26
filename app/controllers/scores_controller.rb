class ScoresController < InheritedResources::Base
  before_filter :remember_location
  before_action :authenticate_player!, except: [ :create ]

  def index
    @scores = Score.all
  end
end
