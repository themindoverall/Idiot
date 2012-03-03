# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "idiot/version"

Gem::Specification.new do |s|
  s.name        = "idiot"
  s.version     = Idiot::VERSION
  s.authors     = ["Chris Serino"]
  s.email       = ["themindoverall@gmail.com"]
  s.homepage    = "http://github.com/themindoverall/idiot"
  s.summary     = %q{Idiot encodes your numerical IDs.}
  s.description = %q{Idiot lets you create encoded IDs like youtube or bitly.}

  s.rubyforge_project = "idiot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
