# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "neo4j-enterprise/version"

Gem::Specification.new do |s|
  s.name        = "neo4j-enterprise"
  s.version     = Neo4j::Enterprise::VERSION
  s.authors     = ["Dmytrii Nagirniak", "Andreas Ronge"]
  s.email       = ["dnagir@gmail.com", "andreas.ronge@gmail.com"]
  s.homepage    = "https://github.com/dnagir/neo4j-enterprise"
  s.summary     = "The neo4j Enterprise edition v#{Neo4j::Enterprise::NEO_VERSION} JAR files"
  s.description = "The Neo4j Enterprise Jar files, adding online backup and High Availability clustering – licensed under AGPL, see http://neo4j.org/licensing-guide/"

  s.rubyforge_project = "neo4j-enterprise"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.platform      = 'java'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
