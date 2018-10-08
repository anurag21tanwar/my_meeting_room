# my_meeting_room

Hi,

lib infos:
1) my_meeting_room rails app uses rails 5.2.1 and ruby 2.5.1
2) used rubocop for code quality
3) rspec for unit tests
4) jquery and bootstrap for ui.
5) fullcalendar for displaying meetings
6) device for authentication
7) psql for db
8) simplecov for test coverage

models:
1) employees i.e # [name, email, password]
             [
              ['Anurag', 'anurag@study.com', 'Test123'],
              ['Anirudh', 'anirudh@study.com', 'Test123'],
              ['Neelima', 'neelima@study.com', 'Test123'],
              ['Feroz', 'feroz@study.com', 'Test123'],
              ['Megha', 'megha@study.com', 'Test123'],
              ['Himanshu', 'himanshu@study.com', 'Test123'],
              ['Bhanu', 'bhanu@study.com', 'Test123']
             ]
2) meetings
3) teams i.e [Dev, Test, OPS, All]
4) conference_rooms i.e ['Mario', 'PacMan', 'Tetris', 'Snake']

bootstrap:
1) install rvm refer rvm.io
2) rvm install ruby-2.5.1
3) git clone git@github.com:anurag21tanwar/my_meeting_room.git
4) cd my_meeting_room
5) bundle
6) rake db:create db:migrate db:seed
7) rails s

open browser http://localhost:3000
login with any pre-seeded employees

test:
1) RAILS_ENV=test rake db:setup db:seed
2) rspec
3) to see test coverage, go to open coverage/index.html

TODO:
1) make Dockerfile