json.data do
  json.partial! 'api/v1/users/user', obj: @obj
end

json.success @success
