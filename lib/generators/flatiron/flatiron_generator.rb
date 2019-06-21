class FlatironGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_flatiron_file
    copy_file "flatiron.rb", "config/flatiron/#{file_name}.rb"
  end
end
