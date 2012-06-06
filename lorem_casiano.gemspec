# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lorem_casiano/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Casiano Rodriguez-Leon"]
  gem.email         = ["casiano.rodriguez.leon@gmail.com"]
  gem.description   = %q{This gem shows how to build a gem using "bundler"}
  gem.summary       = %q{See README.md for more details}
  gem.homepage      = "https://rubygems.org/gems/lorem_casiano"

  gem.add_development_dependency('rspec')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lorem_casiano"
  gem.require_paths = ["lib"]
  gem.version       = LoremCasiano::VERSION
end
