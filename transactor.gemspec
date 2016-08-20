# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transactor/version'

Gem::Specification.new do |s|
  s.name        = 'transactor'
  s.version       = Transactor::VERSION
  s.date        = '2016-07-19'
  s.summary     = "Transactor!"
  s.description = "A library for creating the transaction on the mongodb database...???"
  s.authors     = ["Ayodele Ademosu"]
  s.email       = 'ayoademosu@gmail.com'
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_dependency "mongo", "~> 2.0"

  s.homepage    = 'https://gitlab.com/aademosu/transactor.git'
  s.license       = 'MIT'
end



