module Api::V1
  class OccasionsController < Api::BaseController

    def index
      current_user.occasions
    end

    def create
      occasion = current_user.occasions.new(occasion_params)
      if occasion.save
        render json: occasion
      else
        render_error(401)
      end
    end

    def show
      occasion = current_user.occasions.find(params[:id])
      if occasion.present?
        render json: occasion
      else
        render_error
      end
    end

    protected

    def occasion_params
      params.require(:occasion).permit(:title, :location)
    end
  end
end
