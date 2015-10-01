class ProfilesController < ApplicationController
  before_filter :remember_location
  before_action :authenticate_player!

  def edit
    @player = current_player
  end

  def show
    @player = current_player
  end

  def update
    @player = current_player

    if @player.update(player_params)
      redirect_to profiles_show_path
    else
      render 'edit'
    end
  end

  private

    def player_params
      params.require(:player).permit(:name, :country, :gender)
    end
end
