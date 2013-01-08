# -*- encoding: utf-8 -*-
require File.expand_path('../lib/class_options/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'class_options'
  s.version = ClassOptions::VERSION.dup

  s.authors  = ['Gibheer']
  s.email    = 'gibheer@gmail.com'
  s.license  = '3-clause BSD'
  s.summary  = 'define options on classes'
  s.description = s.summary
  s.homepage = 'http://github.com/gibheer/class_options'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths    = %w(lib)
  s.extra_rdoc_files = %w(README.md LICENSE)

  s.rubygems_version = '1.8.24'
end
