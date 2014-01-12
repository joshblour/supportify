$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "supportify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "supportify"
  s.version     = Supportify::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Supportify."
  s.description = "TODO: Description of Supportify."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency 'cancan'
  s.add_dependency "better_errors"
	s.add_dependency "binding_of_caller"
	s.add_dependency 'simple_form'
  s.add_dependency 'jquery-rails'
  
  s.add_development_dependency "sqlite3"
  
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'

end
