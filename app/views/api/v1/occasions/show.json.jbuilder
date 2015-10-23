unless @error.present?
  json.occasion do
    json.partial! 'api/v1/occasions/occasion', obj: @obj
  end
end

json.error @error if @error.present?
json.success @success




