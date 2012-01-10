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
  s.homepage    = %q{https://github.com/roughneck/rails_templatizer}
  s.summary     = "TODO: Summary of Conversations."
  s.description = "TODO: Description of Conversations."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.rubyforge_project = "conversations"

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "jquery-rails", "~> 1.0.19"

  s.add_development_dependency "sqlite3"
end
