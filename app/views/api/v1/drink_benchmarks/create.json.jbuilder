unless @error.present?
  json.benchmarks do
    json.array! @benchmarks do |obj|
      json.partial! 'api/v1/drink_benchmarks/drink_benchmark', obj: obj
    end
  end
end

json.error @error if @error.present?
json.success @success

