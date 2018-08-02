# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :migrations do
  puts "migrating databases..."
  system("rake db:migrate && rake db:migrate RAILS_ENV=test")
end