# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.include?(lib) || $LOAD_PATH.unshift(lib)
require 'ruport/wiki_table_formatter/version'

Gem::Specification.new do |spec|
  spec.name = 'ruport-wiki-table-formatter'
  spec.version = Ruport::WikiTableFormatter::VERSION
  spec.authors = ['Taichi Ishitani']
  spec.email = ['taichi730@gmail.com']

  spec.summary = 'Wiki table formatter for Ruport'
  spec.homepage = 'https://github.com/taichi-ishitani/ruport-wiki-table-formatter'
  spec.license = 'MIT'

  spec.files = `git ls-files lib LICENSE.txt CODE_OF_CONDUCT.md README.md`.split($RS)
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'ruport'
  spec.add_development_dependency 'bundler', '~> 2.0'
end
