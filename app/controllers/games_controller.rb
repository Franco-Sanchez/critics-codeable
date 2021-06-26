class GamesController < ApplicationController
  before_action :find_game, except: %i[index new create]

  # GET / || /games
  def index
    @games = Game.all
  end

  # GET /games/:id
  def show; end

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  def create
    game = Game.new
    game.save
  end

  # GET /games/:game_id/add_genre/new
  def add_genre_new
    @genre = @game.genres.new
  end

  # POST /games/:game_id/add_genre
  def add_genre
    genre = @game.genres.new
    genre.save
  end

  # GET /games/:game_id/add_platform/new
  def add_platform_new
    @platform = @game.platforms.new
  end

  # POST /games/:game_id/add_platform
  def add_platform
    platform = @game.platforms.new
    platform.save
  end

  private

  def find_game
    @game = Game.find(params[:id] || params[:game_id])
  end
end
