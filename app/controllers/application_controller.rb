class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
        rescue_from ActiveRecord::RecordNotFound, with: :render_404
        before_action :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
        end

        skip_before_action :verify_authenticity_token
        helper_method :current_user, :user_signed_in?

        def render_404
                render status: 404, json: { message: 'record not found' }
        end
end
