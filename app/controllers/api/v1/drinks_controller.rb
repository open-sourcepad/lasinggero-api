module Api::V1
  class DrinksController < Api::BaseController

    def index
      @collection = Drink.all
    end

  end
end

