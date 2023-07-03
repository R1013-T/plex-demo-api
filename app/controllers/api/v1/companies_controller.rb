class Api::V1::CompaniesController < ApplicationController
  before_action :authenticate_api_v1_user!, except: %i[index show]
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    companies = Company.order(created_at: :desc)
    authorize companies
    render json: { companies: companies }
  end

  def show
    authorize @company
    render json: { company: @company }
  end

  def create
    authorize Company
    company = Company.new(company_params)
    if company.save
      render json: { status: 'success', company: company }
    else
      render json: { status: 'error', errors: company.errors }
    end

  end

  def update
    authorize @company
    if @company.update(company_params)
      render json: { status: 'success', company: @company }
    else
      render json: { status: 'error', errors: @company.errors }
    end

  end

  def destroy
    authorize @company
    if @company.destroy
      render json: { status: 'success', company: @company }
    else
      render json: { status: 'error', errors: @company.errors }
    end
  end

  def search
    authorize Company

    match_type = params[:q][:match] || 'and'
    search_params = params[:q][:queries]

    puts params[:q]

    if match_type == 'and'
      @company = Company.ransack(search_params).result(distinct: true)
    else
      # or検索
      search_hash = Hash[search_params.keys.zip(search_params.values)]
      @company = Company.ransack(search_hash.merge(m: 'or')).result(distinct: true)
    end

    render json: { company: @company }

  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:code, :listing_status, :name, :name_kana, :postal_code, :address, :representative_name, :representative_name_kana, :phone, :revenue_2022, :profit_2022, :revenue_2021, :profit_2021, :revenue_2020, :profit_2020)
  end

end
