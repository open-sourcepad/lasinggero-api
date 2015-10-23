module Api::V1
  class OccasionsController < Api::BaseController

    def index
      @collection = current_user.occasions
      @success = true
    end

    def create
      @obj = current_user.occasions.new(occasion_params)
      unless @success = @obj.save
        @error = @obj.errors.full_messages
      end
    end

    def show
      @obj = current_user.occasions.where(id: params[:id]).first
      unless @success = @obj.present?
        @error = ["Occasion not found"]
      end
    end

    protected

    def occasion_params
      params.require(:occasion).permit(:title, :location)
    end
  end
end
