# -*- encoding: utf-8 -*-
# stub: rack_session_access 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rack_session_access".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andriy Yanko".freeze]
  s.date = "2018-04-09"
  s.email = ["andriy.yanko@gmail.com".freeze]
  s.homepage = "https://github.com/railsware/rack_session_access".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.2".freeze
  s.summary = "Rack middleware that provides access to rack.session environment".freeze

  s.installed_by_version = "3.0.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<builder>.freeze, [">= 2.0.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 3.0.1"])
      s.add_development_dependency(%q<chromedriver-helper>.freeze, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>.freeze, ["~> 3.11.0"])
      s.add_development_dependency(%q<rails>.freeze, [">= 4.0.0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<builder>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_dependency(%q<capybara>.freeze, ["~> 3.0.1"])
      s.add_dependency(%q<chromedriver-helper>.freeze, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.11.0"])
      s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<builder>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
    s.add_dependency(%q<capybara>.freeze, ["~> 3.0.1"])
    s.add_dependency(%q<chromedriver-helper>.freeze, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.11.0"])
    s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
  end
end
