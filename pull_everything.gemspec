# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pull_everything/version"

Gem::Specification.new do |spec|
  spec.name          = "pull_everything"
  spec.version       = PullEverything::VERSION
  spec.authors       = ["Kit Langton"]
  spec.email         = ["kitlangton@gmail.com"]

  spec.summary       = %q{Automagically opens PRs for all your Viking Repos.}
  spec.description   = %q{Automagically opens PRs for all your Viking Repos.}
  spec.homepage      = "https://github.com/kitlangton/pull_everything"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "octokit", "~> 4.0"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
