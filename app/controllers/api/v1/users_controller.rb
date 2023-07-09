class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_api_v1_user!, except: %i[index show]
  around_action :set_target_user, only: %i[show update destroy]

  def index
    users = User.order(created_at: :desc)
    authorize users
    render json: { data: users }
  end

  def show
    authorize @user
    render json: @user
  end

  def create
    user = User.new(user_params)
    authorize user
    if user.save
      render json: { data: user }
    else
      render json: { errors: user.errors }
    end
  end

  def update
    authorize @target_user
    if @target_user.update(user_params)
      render json: { data: @target_user }
    else
      render json: { errors: @target_user.errors }
    end
  end

  def destroy
    authorize @user
    @user.destroy
    render json: { message: 'User deleted' }
  end

  private

  def set_target_user
    puts "Before set_target_user"
    @target_user = User.find_by(id: params[:id])
    yield
    puts "After set_target_user"
  end

  def user_params
    if current_api_v1_user.admin?
      params.permit(:id, :name, :email, :password, :role, :permission)
    else
      params.permit(:id, :name, :email, :password, :role)
    end
  end
end