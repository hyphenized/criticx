class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all   # Get all the games and saved them on @games
    render json: @games # Render all the games on JSON format
  end

  def some_action
    render plain: "Test Route"
  end

  def show
    @game = Game.find(params[:id]) # Get an specific game using the id of the URL
    render json: @game # render the specific game using json format
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    else
      render json: @game.errors
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre, :price, :release_date, :company_id)
  end
end
