module Api::V1
  class DrinkBenchmarksController < Api::BaseController

    def index
      current_user.drink_benchmarks
    end

    def create
      drink_benchmark = current_user.drink_benchmarks.new(benchmark_params)
      if drink_benchmark.save
        render json: drink_benchmark
      else
        render_error(401)
      end
    end

    def show
      drink_benchmark = current_user.drink_benchmarks.find(params[:id])
      if drink_benchmark.present?
        render json: drink_benchmark
      else
        render_error
      end
    end

    protected

    def benchmark_params
      params.require(:drink_benchmarks).permit([:user, :drink, :quantity])
    end
  end
end
