
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "swole-news/version"

Gem::Specification.new do |spec|
  spec.name          = "swole-news"
  spec.version       = SwoleNews::VERSION
  spec.authors       = ["'Kriti Rai'"]
  spec.email         = ["'kriti.rai@gmail.com'"]

  spec.summary       = "Pulls up the latest articles in workouts"
  spec.homepage      = "https://github.com/kriti-rai/swole-news"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
