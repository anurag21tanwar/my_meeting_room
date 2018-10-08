# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Conference Rooms
['Mario', 'PacMan', 'Tetris', 'Snake'].each { |cr| ConferenceRoom.create(name: cr) }

# Employees
[
  ['Anurag', 'anurag@study.com', 'Test123'],
  ['Anirudh', 'anirudh@study.com', 'Test123'],
  ['Neelima', 'neelima@study.com', 'Test123'],
  ['Feroz', 'feroz@study.com', 'Test123'],
  ['Megha', 'megha@study.com', 'Test123'],
  ['Himanshu', 'himanshu@study.com', 'Test123'],
  ['Bhanu', 'bhanu@study.com', 'Test123']
].each { |emp| Employee.create(name: emp[0], email: emp[1], password: emp[2]) }

# Teams
['Dev', 'OPS', 'Test'].each { |t| Team.create(name: t) }

# Assign Employee to Team
Team.find_by(name: 'Dev').employees << Employee.where(name: ['Anurag', 'Anirudh'])
Team.find_by(name: 'OPS').employees << Employee.where(name: ['Himanshu', 'Bhanu'])
Team.find_by(name: 'Test').employees << Employee.where(name: ['Feroz', 'Neelima'])


