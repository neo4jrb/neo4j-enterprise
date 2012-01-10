require "neo4j-enterprise/version"

module Neo4j
  module Enterprise

    def self.jars_root
      "#{File.dirname(__FILE__)}/neo4j-enterprise/jars"
    end

    def self.load_jars!
      require 'java'
      require 'neo4j-community'
      require 'neo4j-advanced'
      Dir["#{jars_root}/*.jar"].each {|jar| require jar }
    end

  end
end

Neo4j::Enterprise.load_jars!
