class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_user, only: %i[show, update, destroy]

  def index
    users = User.order(created_at: :desc)
    authorize users
    render json: users
  end

  def show
    authorize @user
    render json: @user
  end

  def create
    user = User.new(user_params)
    authorize user
    if user.save
      render json: user
    else
      render json: { errors: user.errors }
    end
  end

  def update
    authorize @user
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors }
    end
  end

  def destroy
    authorize @user
    @user.destroy
    render json: { message: 'User deleted' }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if @user.admin?
      params.permit(:name, :email, :password, :role, :permission)
    else
      params.permit(:name, :email, :password, :role)
    end
  end

end