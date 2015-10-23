module Api::V1
  class UsersController < Api::BaseController

    skip_before_action :authenticate_user_from_token!, only: :sign_up

    def sign_up
      @obj = User.new(sign_up_params)

      if @success = (device_token && @obj.save)
        @authentication_token = @obj.reset_authentication_token!(device_token)
        AuthenticationToken.clean_up_tokens(params[:user][:device_token], @obj.id)
      else
        render_obj_errors(@obj)
      end
    end

    protected

    def sign_up_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :weight,
        :age,
        :gender
      )
    end

    def device_token
      token = params.require(:user).fetch(:device_token)
      raise(ActionController::ParameterMissing.new("")) if token.blank?
      token
    rescue ActionController::ParameterMissing
      @obj.errors.add(:device_token, 'is required')
      return false
    end

  end
end
