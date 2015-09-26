class ScoresController < ApplicationController
  before_filter :remember_location
  before_action :authenticate_player!

  respond_to :html

  def index
    @scores = Score.all
  end
end

