lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sakuvm/version"

Gem::Specification.new do |spec|
  spec.name          = "sakuvm"
  spec.version       = Sakuvm::VERSION
  spec.authors       = ["grezar"]
  spec.email         = ["grezar.dev@gmail.com"]

  spec.summary       = %q{Displaying sakura virtual hosts.}
  spec.homepage      = "https://github.com/grezar/sakuvm"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rbvmomi'
  spec.add_dependency 'formatador'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
