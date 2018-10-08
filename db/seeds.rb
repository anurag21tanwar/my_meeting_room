# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Conference Rooms
%w[Mario PacMan Tetris Snake].each { |cr| ConferenceRoom.create(name: cr) }

# Employees
[
  %w[Anurag anurag@study.com Test123],
  %w[Anirudh anirudh@study.com Test123],
  %w[Neelima neelima@study.com Test123],
  %w[Feroz feroz@study.com Test123],
  %w[Megha megha@study.com Test123],
  %w[Himanshu himanshu@study.com Test123],
  %w[Bhanu bhanu@study.com Test123]
].each { |emp| Employee.create(name: emp[0], email: emp[1], password: emp[2]) }

# Teams
%w[Dev OPS Test All].each { |t| Team.create(name: t) }

# Assign Employee to Team
Team.find_by(name: 'Dev').employees << Employee.where(name: %w[Anurag Anirudh])
Team.find_by(name: 'OPS').employees << Employee.where(name: %w[Himanshu Bhanu])
Team.find_by(name: 'Test').employees << Employee.where(name: %w[Feroz Neelima])
Team.find_by(name: 'All').employees << Employee.all

# Meetings
m = Meeting.create(title: 'Demo1', start_time: DateTime.parse("#{Date.today} 10:00:00"),
                end_time: DateTime.parse("#{Date.today} 11:00:00"),
                conference_room_id: 1, booked_by: 1, agenda: 'Demo1 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo2', start_time: DateTime.parse("#{Date.today} 12:00:00"),
                    end_time: DateTime.parse("#{Date.today} 14:00:00"),
                    conference_room_id: 2, booked_by: 1, agenda: 'Demo2 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo3', start_time: DateTime.parse("#{Date.today} 08:00:00"),
                    end_time: DateTime.parse("#{Date.today} 9:30:00"),
                    conference_room_id: 3, booked_by: 1, agenda: 'Demo3 App')
m.employees << Employee.all

m = Meeting.create(title: 'Demo4', start_time: DateTime.parse("#{Date.today} 15:00:00"),
                    end_time: DateTime.parse("#{Date.today} 16:00:00"),
                    conference_room_id: 4, booked_by: 1, agenda: 'Demo4 App')
m.employees << Employee.all