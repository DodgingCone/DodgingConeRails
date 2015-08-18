class WelcomeController < ApplicationController
  def index
    if player_signed_in?
      redirect_to scores_path
    end
  end
end
