module Api::V1
  class DrinkBenchmarksController < Api::BaseController

    def index
      @benchmarks = current_user.drink_benchmarks
      @drinks = Drink.all
    end

    def create
      created = []
      benchmark_params[:drink_benchmarks].each do |benchmark|
        created << current_user.drink_benchmarks.create(benchmark)
      end
      error = ""
      created.each do |benchmark|
        error << "#{benchmark.errors.full_messages} #{benchmark.drink_id}. " unless benchmark.errors.empty?
      end

      @error = error
      if error.empty?
        @benchmarks = current_user.drink_benchmarks
        @success = true
      else
        @error = error
        @success = false
      end
    end

    def show
      drink_benchmark = current_user.drink_benchmarks.find(params[:id])
      if drink_benchmark.present?
        drink_benchmark
      else
        render_error
      end
    end

    protected

    def benchmark_params
      params.permit(drink_benchmarks: [:drink_id, :quantity])
    end
  end
end
