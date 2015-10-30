# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# team = Team.create!([{ name: 'admin'}, { email: 'admin@carmaquest.com' }])
team = Team.create!(name: "admin", email: "admin@carmatec.com")
User.create!(email: team.email, password: 'qazplm123', name: 'admin', team_id: team.id)
