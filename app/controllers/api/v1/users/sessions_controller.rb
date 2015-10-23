module Api::V1
  class Users::SessionsController < BaseController

    skip_before_action :authenticate_user_from_token!, only: :create
    before_filter :ensure_device_token_exists, only: :create

    def create
      if @success = authentication_passed?
        @authentication_token = @obj.reset_authentication_token!(params[:user][:device_token])
        AuthenticationToken.clean_up_tokens(params[:user][:device_token], @obj.id)
      else
        @error = 'Invalid credentials'
        render status: 401
      end
    end

    def destroy
      current_user.destroy_authentication_token(params[:user][:device_token])
      render json: { success: true }
    end

    private

    def ensure_device_token_exists
      if params[:user][:device_token].blank?
        @success = false
        @error = 'Missing device_token parameter'
        render status: 401
      end
    end

    def authentication_passed?
      user = User.find_by_email(params[:user][:email])

      if user.try(:valid_password?, params[:user][:password])
        @obj = user
        return true
      end

      return false
    end

  end
end