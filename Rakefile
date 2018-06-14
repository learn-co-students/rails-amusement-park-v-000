# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'serializes boolean values'
task :serializeusers do
    User.where("boolean_column = 't'").update_all(boolean_column: 1)
    User.where("boolean_column = 'f'").update_all(boolean_column: 0)
    end