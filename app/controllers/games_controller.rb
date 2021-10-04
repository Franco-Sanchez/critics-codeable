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
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /games/:id/edit
  def edit; end

  # PATCH /games/:id
  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  # DELETE /games/:id
  def destroy
    @game.destroy
    redirect_to root_path
  end

  # GET /games/:game_id/add-genre/new
  def add_genre_new
    @genre = @game.genres.new
  end

  # POST /games/:game_id/add-genre
  def add_genre
    found_genre = Genre.find(params[:genre_id])
    @game.genres << found_genre unless @game.genres.include?(found_genre)
    redirect_to @game
  end

  # DELETE /games/:game_id/remove-genre/:genre_id
  def remove_genre
    genre = Genre.find(params[:genre_id])
    @game.genres.delete(genre)
    redirect_to @game
  end

  # GET /games/:game_id/add-platform/new
  def add_platform_new
    @platform = @game.platforms.new
  end

  # POST /games/:game_id/add-platform
  def add_platform
    found_platform = Platform.find(params[:platform_id])
    @game.platforms << found_platform unless @game.platforms.include?(found_platform)
    redirect_to @game
  end

  # DELETE /games/:game_id/remove-platform/:platform_id
  def remove_platform
    platform = Platform.find(params[:platform_id])
    @game.platforms.delete(platform)
    redirect_to @game
  end

  private

  def find_game
    @game = Game.find(params[:id] || params[:game_id])
  end

  def game_params
    params.require(:game).permit(:name, :summary, :released_date, :category, :rating,
                                 :parent_id, :cover)
  end
end
