$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_profiler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_profiler"
  s.version     = RailsProfiler::VERSION
  s.authors     = ["Emil Soman"]
  s.email       = ["emil.soman@gmail.com"]
  s.homepage    = "https://github.com/emilsoman/rails_profiler"
  s.summary     = "Rails engine that reveals high level profiling information of your Rails pages"
  s.description = "Rails engine that reveals high level profiling information of your Rails pages"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
