class CompanyController < ApplicationController
  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    company = Company.new
    company.save
  end
end
