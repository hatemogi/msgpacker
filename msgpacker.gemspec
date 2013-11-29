lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'msgpacker/version'

Gem::Specification.new do |spec|
  spec.name          = "msgpacker"
  spec.version       = Msgpacker::VERSION
  spec.authors       = ["Daehyun Kim"]
  spec.email         = ["https://twitter.com/hatemogi"]
  spec.description   = %q{This gem provides a executable ruby script that converts a JSON stream to MessagePack-ed one and the other way around.}
  spec.summary       = %q{streaming JSON <-> MessagePack converter}
  spec.homepage      = "http://github.com/hatemogi/msgpacker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.bindir        = 'bin'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "yajl-ruby"
  spec.add_runtime_dependency "msgpack"

  spec.executables << 'msgpacker' 
end
