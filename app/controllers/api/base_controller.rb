module Api
  class BaseController < ApplicationController
    # include ApiVersions::SimplifyFormat
    include ActionController::MimeResponds
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    before_filter :cors_set_access_control_headers
    before_filter :cors_preflight_check
    skip_before_filter :verify_authenticity_token
    # before_filter :validate_authentication_token


    def handle_options_request
      head(:ok) if request.request_method == "OPTIONS"
    end

    protected

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Expose-Header'] = ''
      # headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
      headers['Access-Control-Max-Age'] = '1728000'
      headers['Vary'] = 'Origin'
    end

    # If this is a preflight OPTIONS request, then short-circuit the
    # request, return only the necessary headers and return an empty
    # text/plain.

    def cors_preflight_check
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def check_existence_of(model, ids)
      return if model.singularize.camelize.constantize.exists?(id: ids)
      render json: { success: false, message: "#{model.camelize} not found" }, status: 200
    end

    def ensure_params_exists(condition, message)
      return unless condition
      render json: { success: false, message: message }, status: 200
    end

    def check_existence_of_device_token(token)
      return if UserToken.exists?(token: token, token_type: UserToken::TOKEN_TYPES[:device_token])
      render json: { success: false, message: "Device Token not found" }, status: 200
    end

    def check_existence_of_sweigh(id)
      return if Sweigh.unscoped.where(deleted_at: nil).exists?(id: id)
      render json: { success: false, message: "Sweigh not found" }, status: 200
    end

    def current_user
      # if params[:authentication_token].present?
      #   @current_user ||= User.find_by_authentication_token(params[:authentication_token])
      #   if @current_user.present?
      #     return @current_user
      #   end
      # elsif params[:unique_key].present?
      #   @current_user ||= Guest.find_or_initialize_by(authentication_token: params[:unique_key])

      #   if @current_user.present?
      #     return @current_user
      #   end
      # end
    end

    def deactivated_user
      render json: { success: false, signin_error: 102 }, status: 200
    end

    def ensure_authentication_token_exist
      ensure_params_exists(
        params[:authentication_token].blank?,
        "Missing authentication_token parameter"
      )
    end

    def check_validity_of_authentication_token
        return if current_user.present?
        render json: { success: false, message: "Invalid authentication_token parameter" }, status: 200
    end

    def is_current_user_active?
      return if current_user.present? and current_user.active?
      deactivated_user
    end

    def validate_authentication_token
      # Try to add the token param in header not in the url
      # authenticate_or_request_with_http_token do |token, options|
      #   auth_token = User.find_by_authentication_token(token)
      #   return if auth_token
      #   render json: { success: false, message: "Invalid authentication_token parameter" }, status: 401
      #   #return head :unauthorized unless auth_token
      # end
      ensure_authentication_token_exist || check_validity_of_authentication_token || is_current_user_active?
    end

    def ensure_params_user_exist
      ensure_params_exists(
        params[:user].blank?,
        "Missing user parameter"
      )
    end

    def set_page_and_count
      @page = params[:page].present? ? params[:page] : 1
      @count = params[:count].present? ? params[:count] : 10
    end

    def render_error(status=404, msg="Not Found")
      render json: { success: false, msg: "Not Found"}, status: status
    end

    def not_found
      respond_to do |format|
        render_error(404)
      end
    end

    def render_obj_errors(obj)
      render json: {
        message: 'Validation failed', errors: (obj).errors.full_messages
      }
    end

  end
end
