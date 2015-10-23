json.drinks do
  json.array! @collection do |obj|
    json.partial! 'api/v1/drinks/drink', obj: obj
  end
end

json.success true

