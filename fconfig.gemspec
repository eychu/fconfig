# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fconfig/version'

Gem::Specification.new do |spec|
  spec.name          = "fconfig"
  spec.version       = Fconfig::VERSION
  spec.authors       = ["Alexey Chuvashov"]
  spec.email         = ["alexeychu@gmail.com"]
  spec.description   = %q{Test config gem}
  spec.summary       = %q{Description}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "rspec-expectations"
end
