# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "conversations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "conversations"
  s.version     = Conversations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Patrick Bartels"]
  s.email       = ["patrick@bartels.ug"]
  s.homepage    = %q{https://github.com/roughneck/conversations}
  s.summary     = "Summary of Conversations."
  s.description = "Description of Conversations."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.rubyforge_project = "conversations"

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "jquery-rails", "~> 2.1.1"

  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "rspec-rails", "~> 2.8"
  s.add_development_dependency "capybara", "~> 1.1"
  s.add_development_dependency "factory_girl_rails", "~> 1.4"
  s.add_development_dependency "simplecov", "~> 0.5"
end
