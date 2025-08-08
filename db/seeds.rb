[ "HND", "NRT", "CTS", "YYZ", "YVR" ].each do |code|
  Airport.find_or_create_by!(airport_code: code)
end

airports = Airport.all.to_a

airports.each do |origin|
  airports.each do |destination|
    next if origin == destination

    Flight.create!(
      origin_id: origin.id,
      destination_id: destination.id,
      departure_time: DateTime.now + rand(1..10).days + rand(0..23).hours,
      duration_minutes: rand(60..600)
    )
  end
end