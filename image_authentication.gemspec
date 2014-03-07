# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "image_authentication/version"

Gem::Specification.new do |s|
  s.name        = "image_authentication"
  s.version     = ImageAuthentication::VERSION.dup
  s.authors     = ["Kieran Johnson"]
  s.email       = ["kieran@invisiblelines.com"]
  s.homepage    = "https://github.com/invisiblelines/image_authentication"
  s.summary     = %q{Image authentication extension for devise}
  s.description = "Provides secondary authentication by asking the user to select their chosen images"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails', '>= 3.1.1'
  s.add_runtime_dependency 'devise'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'factory_girl_rails'
end
