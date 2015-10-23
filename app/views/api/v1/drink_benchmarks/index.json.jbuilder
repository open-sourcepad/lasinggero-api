json.drinks do
  json.array! @drinks do |obj|
    json.partial! 'api/v1/drinks/drink', obj: obj
  end
end
json.drink_benchmarks do
  json.array! @benchmarks do |obj|
    json.partial! 'api/v1/drink_benchmarks/drink_benchmark', obj: obj
  end
end

json.success true

