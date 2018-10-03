# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Conference Rooms
['Mario', 'PacMan', 'Tetris', 'Snake'].each { |cr| ConferenceRoom.create(name: cr) }

# Employees
[
  ['Anurag', 'anurag@room.com'],
  ['Anirudh', 'anirudh@room.com'],
  ['Neelima', 'neelima@room.com'],
  ['Feroz', 'feroz@room.com'],
  ['Megha', 'megha@room.com'],
  ['Himanshu', 'himanshu@room.com'],
  ['Bhanu', 'bhanu@room.com']
].each_with_index { |emp, i| Employee.create(name: emp[0], email: emp[1]) }

# Teams
['Dev', 'OPS', 'Test'].each { |t| Team.create(name: t) }