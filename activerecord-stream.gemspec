# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/stream/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-stream"
  spec.version       = ActiveRecord::Stream::VERSION
  spec.authors       = ["Scott Fleckenstein"]
  spec.email         = ["nullstyle@gmail.com"]
  spec.description   = %q{lazy-ish, Enumerator based traversal of data within ActiveRecord}
  spec.summary       = %q{lazy-ish, Enumerator based traversal of data within ActiveRecord}
  spec.homepage      = "https://github.com/nullstyle/activerecord-stream"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"


  spec.add_dependency "activerecord", ">= 3.2.0"
  spec.add_dependency "activesupport", ">= 3.2.0"
end
