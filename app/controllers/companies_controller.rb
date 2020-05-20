class CompaniesController < ApplicationController
  def index
    @companies = Company.all # Get all the companies and saved them on @companies
    render json: @companies # Render all the companies on JSON format
  end
end
