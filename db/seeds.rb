# db/seeds.rb

# Clear existing data
Flight.destroy_all
Airport.destroy_all

# Create airports
sfo = Airport.create!(code: "SFO")
jfk = Airport.create!(code: "JFK")
lax = Airport.create!(code: "LAX")
ord = Airport.create!(code: "ORD")

# Create flights
Flight.create!(departure_airport: sfo, arrival_airport: jfk, start_datetime: DateTime.now + 1.day, duration: 300)
Flight.create!(departure_airport: jfk, arrival_airport: lax, start_datetime: DateTime.now + 2.days, duration: 360)
Flight.create!(departure_airport: lax, arrival_airport: ord, start_datetime: DateTime.now + 3.days, duration: 240)
Flight.create!(departure_airport: ord, arrival_airport: sfo, start_datetime: DateTime.now + 4.days, duration: 420)
