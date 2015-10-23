unless @error.present?
  json.occasion do
    json.partial! 'api/v1/occasions/occasion', obj: @obj
  end

  json.drink do
    json.partial! 'api/v1/drinks/drink', obj: @current_drink
  end
end

json.error @error if @error.present?
json.success @success
