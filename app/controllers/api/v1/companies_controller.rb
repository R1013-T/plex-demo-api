class Api::V1::CompaniesController < ApplicationController

  # before_action => コントローラの全てのアクションが実行される前に処理を行う
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    companies = Company.order(created_at: :desc)
    render json: { companies: companies}
  end

  def show
    render json: { company: @company}
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: { status: 'success', company: company }
    else
      render json: { status: 'error', errors: company.errors }
    end

  end

  def update
    if @company.update(company_params)
      render json: { status: 'success', company: @company }
    else
      render json: { status: 'error', errors: @company.errors }
    end

  end

  def destroy
    if @company.destroy
      render json: { status: 'success', company: @company }
    else
      render json: { status: 'error', errors: @company.errors }
    end
  end

  private

  def set_post
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:code, :listing_status, :name, :name_kana, :postal_code, :address, :representative_name, :representative_name_kana, :phone, :revenue_2022, :profit_2022, :revenue_2021, :profit_2021, :revenue_2020, :profit_2020)
  end

end
