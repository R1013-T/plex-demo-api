class Api::V1::CompaniesController < ApplicationController

  # before_action => コントローラの全てのアクションが実行される前に処理を行う
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    companies = Company.order(created_at: :desc)
    render json: { companies: companies}
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def set_post
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:code, :listing_status, :name, :name_kana, :postal_code, :address, :representative_name, :representative_name_kana, :phone, :revenue_2022, :profit_2022, :revenue_2021, :profit_2021, :revenue_2020, :profit_2020)
  end

end
