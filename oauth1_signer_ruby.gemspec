Gem::Specification.new do |gem|
  gem.name          = "mastercard_oauth1_signer"
  gem.authors       = ["Mastercard"]
  gem.summary       = %q{Mastercard client authentication library}
  gem.description   = %q{Zero dependency library for generating a Mastercard API compliant OAuth signature}
  gem.version       = "1.1.3"
  gem.license       = "MIT"
  gem.homepage      = "https://github.com/Mastercard/oauth1-signer-ruby"
  gem.files         = Dir["{bin,spec,lib}/**/*"]+ Dir["data/*"] + ["oauth1_signer_ruby.gemspec"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_development_dependency 'bundler', '>= 1.5'
  gem.add_development_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'rake', ">= 12.3.3"
  gem.add_development_dependency 'simplecov', '~> 0.16.1'
end
