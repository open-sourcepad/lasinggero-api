json.occasions do
  json.array! @collection do |obj|
    json.partial! 'api/v1/occasions/occasion', obj: obj
  end
end

json.success @success


