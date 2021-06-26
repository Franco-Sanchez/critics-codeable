class InvolvedCompaniesController < ApplicationController
  before_action :find_game

  # GET /games/:game_id/involved_companies/new
  def new
    @involved_company = @game.involved_companies.new
  end

  # POST /games/:game_id/involved_companies
  def create
    involved_company = @game.involved_companies.new
    involved_company.save
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end
end
