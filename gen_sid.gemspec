# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gen_sid/version'

Gem::Specification.new do |spec|
  spec.name          = "gen_sid"
  spec.version       = GenSid::VERSION
  spec.authors       = ["Tracy Flynn"]
  spec.email         = ["tracy.flynn@verymuchme.com"]
  spec.summary       = %q{Generate sequential identifiers}
  spec.description   = %q{Generate sequential identifiers using alpha-numeric template}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
