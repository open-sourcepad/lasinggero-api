module Api::V1
  class OccasionsController < Api::BaseController

    def index
      render json: { foo: 'bar' }
    end

    def create
      occasion = Occasion.new(occasion_params)
      if occasion.save
        render json: occasion
      else
        render json: { success: false }, status: 401
      end
    end

    protected

    def occasion_params
      params.permit(:title, :location)
    end
  end
end
