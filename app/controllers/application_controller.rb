class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= User.find_by_authentication_token(params[:authentication_token])
  end
  helper_method :current_user

  private

  def authenticate_user_from_token!
    if current_user.nil?
      return render json: {
        message: 'Unauthorized request'
      }, status: 401
    end
  end
end
