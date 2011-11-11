# -*- encoding: utf-8 -*-
require File.expand_path('../lib/stint/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joshua Flanagan"]
  gem.email         = ["joshuaflanagan@gmail.com"]
  gem.description   = %q{What are you working on?}
  gem.summary       = %q{What are you working on?}
  gem.homepage      = "https://github.com/joshuaflanagan/stint"

  gem.add_dependency 'httparty', '~>0.8'
  gem.add_development_dependency 'rspec', '~>2.0'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "stint"
  gem.require_paths = ["lib"]
  gem.version       = Stint::VERSION
end
