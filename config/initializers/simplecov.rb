if Rails.env.test?
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter '/spec'
    add_filter '/config'
    add_filter '/app/mailers'
    add_filter '/app/jobs'
    add_filter '/app/channels'
    add_filter '/app/helpers'
    add_filter '/lib'

    add_group 'Models', 'app/models'
    add_group 'Controllers', 'app/controllers'
  end
end
