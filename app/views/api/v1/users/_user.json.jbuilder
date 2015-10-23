json.extract! obj, *%i(
  id
  email
  name
  created_at
  updated_at
)

json.authentication_token @authentication_token if @authentication_token
