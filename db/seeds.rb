# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Visit.create(vid: 0)
User.create(name: 'user1', email: 'user1@gmail.com', password: 'user1pass')
Member.create(name: 'Sanskrit Club', email: 'sanskritclub@iitr.ac.in', password: 'namaskar')