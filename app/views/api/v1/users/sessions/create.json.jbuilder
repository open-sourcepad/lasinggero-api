if @obj.present?
  json.data do
    json.partial! 'api/v1/users/user', obj: @obj
  end
end

json.error @error if @error.present?
json.success @success
