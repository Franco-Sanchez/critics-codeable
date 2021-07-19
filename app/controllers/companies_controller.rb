class CompaniesController < ApplicationController
  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    company = Company.new
    if company.save
      redirect_to root_path
    else
      redirect :new
    end
  end
end
