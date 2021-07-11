# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks


# DEPRECATION WARNING: Leaving `ActiveRecord::ConnectionAdapters::SQLite3Adapter.represent_boolean_as_integer` set to false is deprecated. SQLite databases have used 't' and 'f' to serialize boolean values and must have old data converted to 1 and 0 (its native boolean serialization) before setting this flag to true. Conversion can be accomplished by setting up a rake task which runs:

desc "Rake task for Rails boolean_as_integer deprecation"
task :bool_as_int do
  User.where("boolean_column = 't'").update_all(boolean_column: 1)
  User.where("boolean_column = 'f'").update_all(boolean_column: 0)
end

# for all models and all boolean columns, after which the flag must be set to true by adding the following to your application.rb file:

# Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true