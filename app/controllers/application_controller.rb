class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from Pundit::NotAuthorizedError, with: :render_403

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:sign_in , keys: [:session])
  end

  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?

  def render_404
    render status: 404, json: { message: 'record not found' }
  end

  def render_403
    render status: 403, json: { message: "You don't have permission." }
  end

  def pundit_user
    current_api_v1_user
  end
end
