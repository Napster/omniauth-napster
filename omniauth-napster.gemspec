# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-napster'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-napster"
  gem.version       = OmniAuth::Napster::VERSION
  gem.authors       = ["Richard Luck"]
  gem.email         = ["rluck@rhapsody.com"]
  gem.description   = %q{This gem provides the OmniAuth strategy for connecting to the Napster API.}
  gem.summary       = %q{OmniAuth strategy for Napster Music Service}
  gem.homepage      = "https://github.com/Rhapsody/omniauth-napster.git"
  gem.required_ruby_version = '~> 2.0'
  gem.licenses    = ['MIT']
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.3'
  gem.add_development_dependency 'rspec', '~> 3.0'
end
