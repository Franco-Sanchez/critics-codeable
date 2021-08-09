class InvolvedCompaniesController < ApplicationController
  before_action :find_game

  # GET /games/:game_id/involved_companies/new
  def new
    @involved_company = @game.involved_companies.new
  end

  # POST /games/:game_id/involved_companies
  def create
    involved_company = @game.involved_companies.new(involved_company_params)
    if involved_company.save
      redirect_to @game
    else
      redirect :new
    end
  end

  # DELETE /games/:game_id/involved_companies/:id
  def destroy
    company = Company.find(params[:id])
    @game.involved_companies.delete(company)
    redirect_to @game
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def involved_company_params
    params.require(:involved_company).permit(:company_id, :publisher, :developer)
  end
end
