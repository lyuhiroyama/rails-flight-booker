["HND", "NRT", "CTS", "YYZ", "YVR"].each do |code|
  Airport.find_or_create_by!(airport_code: code)
end