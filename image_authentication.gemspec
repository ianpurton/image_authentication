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

  s.add_runtime_dependency 'rails', '> 5.0.0'
  s.add_runtime_dependency 'devise', '>= 4.1.1'
  s.add_runtime_dependency 'coffee-rails'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec-rails', '~> 3.5.0.beta3'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pg'
  # s.add_development_dependency 'guard-rspec', '~> 4.7.0'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'coveralls'
end
