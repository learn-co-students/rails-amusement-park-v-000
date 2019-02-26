# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
desc "boolean update for deprecation"
task :update_boolean do
  Users.where("boolean_column = 't'").update_all(boolean_column: 1)
  Users.where("boolean_column = 'f'").update_all(boolean_column: 0)
end

