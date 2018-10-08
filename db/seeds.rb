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
['Dev', 'OPS', 'Test', 'All'].each { |t| Team.create(name: t) }

# Assign Employee to Team
Team.find_by(name: 'Dev').employees << Employee.where(name: ['Anurag', 'Anirudh'])
Team.find_by(name: 'OPS').employees << Employee.where(name: ['Himanshu', 'Bhanu'])
Team.find_by(name: 'Test').employees << Employee.where(name: ['Feroz', 'Neelima'])
Team.find_by(name: 'All').employees << Employee.all

# Meetings
m = Meeting.create(title: 'Demo1', start_time: DateTime.parse('09-10-2018 10:00:00'),
                end_time: DateTime.parse('09-10-2018 11:00:00'),
                conference_room_id: 1, booked_by: 1, agenda: 'Demo1 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo2', start_time: DateTime.parse('09-10-2018 12:00:00'),
                    end_time: DateTime.parse('09-10-2018 14:00:00'),
                    conference_room_id: 2, booked_by: 1, agenda: 'Demo2 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo3', start_time: DateTime.parse('10-10-2018 09:00:00'),
                    end_time: DateTime.parse('10-10-2018 11:00:00'),
                    conference_room_id: 3, booked_by: 1, agenda: 'Demo3 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo4', start_time: DateTime.parse('10-10-2018 13:00:00'),
                    end_time: DateTime.parse('10-10-2018 15:00:00'),
                    conference_room_id: 4, booked_by: 1, agenda: 'Demo4 App')
m.employees << Employee.all