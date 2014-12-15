# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utep_sso/version'

Gem::Specification.new do |spec|
  spec.name          = "utep_sso"
  spec.version       = UTEPSSO::VERSION
  spec.authors       = ["Alan Wernick"]
  spec.email         = ["alan.wernik@gmail.com"]
  spec.summary       = %q{UTEP SingleSignOn Authentication for Ruby}
  spec.description   = %q{Fetch user information using UTEP's Single Sign On service}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "savon", "~> 2.8.0"
end
