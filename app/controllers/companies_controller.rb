class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @companies = Company.all # Get all the companies and saved them on @companies
    render json: @companies # Render all the companies on JSON format
  end

  def show
    @company = Company.find(params[:id]) # Get an specific company using the id of the URL
    render json: @company # render the specific company using json format
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company
    else
      render json: @company.errors
    end
  end

  def destroy
    @company = Company.find(params[:id]) # Find the company you want to destroy.
    @company.destroy # Destroy it.
    render json: { status: 'Successfully destroyed', data: @company }, status: :ok
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
