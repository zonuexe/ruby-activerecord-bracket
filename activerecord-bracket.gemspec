# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-bracket/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-bracket'
  spec.version       = ActiveRecord::Bracket::VERSION
  spec.authors       = ['USAMI Kenta']
  spec.email         = ['tadsan@zonu.me']
  spec.description   = %q{Provide bracket-method `[]` for ActiveRecord Class}
  spec.summary       = %q{}
  spec.homepage      = 'http://dt.zonu.me'
  spec.license       = 'GPLv3 or NYSL'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'activerecord'
  spec.add_runtime_dependency 'activesupport'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
