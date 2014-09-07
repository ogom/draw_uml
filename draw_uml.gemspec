# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'draw_uml/version'

Gem::Specification.new do |spec|
  spec.name          = "draw_uml"
  spec.version       = DrawUml::VERSION
  spec.authors       = ["ogom"]
  spec.email         = ["ogom@hotmail.co.jp"]
  spec.summary       = %q{Drawing the Unified Modeling Language.}
  spec.description   = %q{Drawing the Unified Modeling Language of Rack.}
  spec.homepage      = "http://ogom.github.io/draw_uml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
