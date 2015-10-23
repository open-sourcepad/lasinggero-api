module Api
  class BaseController < ApplicationController

    before_action :authenticate_user_from_token!
    before_action :set_page_and_count

    protected

    def render_obj_errors(obj = nil)
      render json: {
        message: 'Validation failed', errors: (obj || @obj).errors.full_messages
      }, status: 422
    end

    def render_obj_errors(obj)
      render json: {
        message: 'Validation failed', errors: (obj).errors.full_messages
      }
    end

    private

    def create_user_setting
      @obj.user_setting = UserSetting.create(user: @obj) if @obj.user_setting.blank?
    end

    def set_page_and_count
      @page = params[:page].present? ? params[:page] : 1
      @count = params[:count].present? ? params[:count] : 10
    end

    def get_card
      @card = Card.find_by(id: params[:id])

      if @card.blank?
        @success = false
        @error = 'Card not found.'
        return render status: 401
      end
    end

  end
end

