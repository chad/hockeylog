# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hockeylog/version'

Gem::Specification.new do |spec|
  spec.name          = "hockeylog"
  spec.version       = Hockeylog::VERSION
  spec.authors       = ["Chad Fowler"]
  spec.email         = ["chad@chadfowler.com"]
  spec.summary       = %q{Aggregate multiple hockeyapp notes into a single changelog.}
  spec.description       = %q{Aggregate multiple hockeyapp notes into a single changelog.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'hockeyapp', '~>0.0'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
