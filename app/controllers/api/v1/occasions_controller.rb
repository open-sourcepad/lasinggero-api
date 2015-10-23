module Api::V1
  class OccasionsController < Api::BaseController

    def index
      render json: { foo: 'bar' }
    end
  end
end
