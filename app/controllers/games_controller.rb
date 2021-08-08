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
    game = Game.new(game_params)
    if game.save
      redirect_to root_path
    else
      redirect :new
    end
  end

  # GET /games/:game_id/add_genre/new
  def add_genre_new
    @genre = @game.genres.new
  end

  # POST /games/:game_id/add_genre
  def add_genre
    p params
    genre = @game.genres.new(genre_params)
    if genre.save
      redirect_to @game
    else
      redirect :add_genre_new
    end
  end

  # GET /games/:game_id/add_platform/new
  def add_platform_new
    @platform = @game.platforms.new
  end

  # POST /games/:game_id/add_platform
  def add_platform
    p params
    platform = @game.platforms.new(platform_params)
    if platform.save
      redirect_to @game
    else
      redirect :add_platform_new
    end
  end

  private

  def find_game
    @game = Game.find(params[:id] || params[:game_id])
  end

  def game_params
    params.require(:game).permit(:name, :summary, :released_date, :category, :rating,
                                 :parent_id, :cover)
  end

  def genre_params
    params.require(:genre).permit(:genre_id)
  end

  def platform_params
    params.require(:platform).permit(:platform_id)
  end
end
