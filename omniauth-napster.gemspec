# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'omniauth/napster'

Gem::Specification.new do |s|
  s.name          = "omniauth-napster"
  s.version       = OmniAuth::Napster::VERSION
  s.authors       = ["Richard Luck"]
  s.email         = ["rluck@rhapsody.com"]
  s.description   = %q{This gem provides the OmniAuth strategy for connecting to the Napster API.}
  s.summary       = %q{OmniAuth strategy for Napster Music Service}
  s.homepage      = "https://github.com/Napster/omniauth-napster.git"
  s.license    = 'MIT'
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.3'
  s.add_development_dependency 'rspec', '~> 3.0'
end
