# frozen_string_literal: true

require_relative 'lib/cli_chess/version'

Gem::Specification.new do |spec|
  spec.name = 'cli_chess'
  spec.version = Version::VERSION
  spec.summary = 'Command line chess game'
  spec.description = 'Chess game for terminals. Play it against your friends or against a bot!'
  spec.license = 'MIT'

  spec.required_ruby_version = '>= 3.0.0'

  spec.author = 'Lorenzo Zabot'
  spec.email = ['lorenzozabot@gmail.com']
  spec.homepage = 'https://github.com/Uaitt/cli_chess'

  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir['exe/**', 'lib/**/*.rb', 'LICENSE', 'README.md']
  spec.require_paths = ['lib']
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.bindir = 'exe'

  spec.add_runtime_dependency 'colorize', '~> 1'
  spec.add_runtime_dependency 'require_all', '~> 3'
end
