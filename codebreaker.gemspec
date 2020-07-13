# frozen_string_literal: true

require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker'
  spec.version       = Codebreaker::VERSION
  spec.authors       = ['Artyom Shevchenko']
  spec.email         = ['artemsheva0510@gmail.com']

  spec.summary       = 'Codebreaker game'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'lefthook'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'solargraph'
end
