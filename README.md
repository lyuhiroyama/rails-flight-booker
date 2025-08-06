# Data Architecture plan

### The project:

- A site that allows users to search for & book one-way flights.
- Users can search for available flights by selecting departure/arrival airports, date, and number of passengers.
- After selecting a flight, users can enter booking & passenger details.
- Each booking is linked to a specific flight and can include multiple passengers.
- Flights take place at a specific date & (departure) time, and between two airport locations.

(Table: **airports**)
- id: integer
- airport_code: string
- created_at: datetime
- updated_at: datetime
- ........................................................
- has_many :departing_flights, class_name: "Flight", foreign_key: "origin_id", inverse_of: :departure_airport
- has_many :arriving_flights, class_name: "Flight", foreign_key: "destination_id", inverse_of: :arrival_airport

(Table: **flights**)
- id: integer
- departure_time: datetime
- duration_minutes: integer
- origin_id: integer [foreign key to airports]
- destination_id: integer [foreign key to airports]
- created_at: datetime
- updated_at: datetime
- ........................................................
- belongs_to :departure_airport, class_name: "Airport", foreign_key: "origin_id", inverse_of: :departing_flights
- belongs_to :arrival_airport, class_name: "Airport", foreign_key: "destination_id", inverse_of: :arriving_flights
- ........................................................
- has_many :bookings

(Table: **bookings**)
- id: integer
- flight_id: integer [foreign key to flights]
- created_at: datetime
- updated_at: datetime
- ........................................................
- belongs_to :flight
- has_many :passengers, inverse_of: bookings
- accepts_nested_attributes_for :passengers

(Table: **passengers**)
- id: integer
- name: string
- email: string
- booking_id: integer [foreign key to bookings]
- created_at: datetime
- updated_at: datetime
- ........................................................
- belongs_to :booking