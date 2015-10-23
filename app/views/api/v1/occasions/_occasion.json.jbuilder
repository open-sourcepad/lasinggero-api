json.extract! obj, *%i(
  id
  title
  location
  
  created_at
  updated_at
)

json.percentage_until_max obj.percentage_until_max(obj.user)
json.servings_left_until_max obj.servings_left_until_max(obj.user, @current_drink)