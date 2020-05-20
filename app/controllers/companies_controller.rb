class CompaniesController < ApplicationController
  def index
    @companies = Company.all # Get all the companies and saved them on @companies
    render json: @companies # Render all the companies on JSON format
  end

  def show
    @company = Company.find(params[:id]) # Get an specific company using the id of the URL
    render json: @company # render the specific company using json format
  end
end
