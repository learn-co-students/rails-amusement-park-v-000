class FlatironGenerator < Rails::Generators::Base
  def create_flatiron_file
    create_file "config/flatiron/flatiron.rb", "# Add initialization content here"
  end
end
