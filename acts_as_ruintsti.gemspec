$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_ruintsti/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_ruintsti"
  s.version     = ActsAsRuintsti::VERSION
  s.authors     = ["Ru/MuckRu"]
  s.email       = ["ru_shalm@hazimu.com"]
  s.homepage    = "https://github.com/rutan/acts_as_ruintsti"
  s.summary     = "use the type of integer in the STI(Single Table Inheritance)"
  s.description = "use the type of integer in the STI(Single Table Inheritance)"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
