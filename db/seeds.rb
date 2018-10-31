# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Save for future user functionality
# User.create(name: "Fred", email: "fred@rails.com", password: "password")
# User.create(name: "George", email: "george@rails.com", password: "password")
# User.create(name: "Linda", email: "linda@rails.com", password: "password")
# User.create(name: "Clara", email: "clara@rails.com", password: "password")
# User.create(name: "Bob", email: "bob@rails.com", password: "password")

Condition.create(code: 800 , desc: "Clear")
Condition.create(code: 900 , desc: "Clouds")
Condition.create(code: 700 , desc: "Atmosphere")
Condition.create(code: 600 , desc: "Snow")
Condition.create(code: 500 , desc: "Rain")
Condition.create(code: 300 , desc: "Drizzle")
Condition.create(code: 200 , desc: "Thunderstorm")
Condition.create(code: 100 , desc: "Any")


Activity.create(desc: "Bike Ride", max_temp: 90, min_temp: 60, max_wind_speed: 7)
Activity.create(desc: "Kayak", max_temp: 100, min_temp: 70, max_wind_speed: 7)
Activity.create(desc: "Read")
Activity.create(desc: "Go to a Museum")
Activity.create(desc: "Garden", max_temp: 90, min_temp: 60, max_wind_speed: 15)
Activity.create(desc: "Hike", max_temp: 90, min_temp: 25, max_wind_speed: 15)
Activity.create(desc: "Snowshoe", max_temp: 30, min_temp: 20, max_wind_speed: 10)


ActivityCondition.create(activity_id: 1, condition_id: 1)
ActivityCondition.create(activity_id: 1, condition_id: 2)
ActivityCondition.create(activity_id: 2, condition_id: 1)
ActivityCondition.create(activity_id: 2, condition_id: 2)
ActivityCondition.create(activity_id: 3, condition_id: 8)
ActivityCondition.create(activity_id: 4, condition_id: 8)
ActivityCondition.create(activity_id: 5, condition_id: 1)
ActivityCondition.create(activity_id: 5, condition_id: 2)
ActivityCondition.create(activity_id: 6, condition_id: 1)
ActivityCondition.create(activity_id: 6, condition_id: 2)
ActivityCondition.create(activity_id: 6, condition_id: 4)
ActivityCondition.create(activity_id: 7, condition_id: 1)
ActivityCondition.create(activity_id: 7, condition_id: 2)
ActivityCondition.create(activity_id: 7, condition_id: 4)


