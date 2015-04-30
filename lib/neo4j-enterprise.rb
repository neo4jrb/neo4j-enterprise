require "neo4j-enterprise/version"

module Neo4j
  module Enterprise
    def self.jars_root
      File.join("#{File.dirname(__FILE__)}", "neo4j-enterprise", "jars")
    end

    def self.test_jars_root
      File.join("#{File.dirname(__FILE__)}", "neo4j-enterprise", "test-jars")
    end

    def self.load_jars!
      require 'java'
      Dir["#{jars_root}/*.jar"].each {|jar| require jar }
    end

    def self.load_test_jars!
      require 'java'
      Dir["#{test_jars_root}/*.jar"].each {|jar| require jar }
    end
  end
end

Neo4j::Enterprise.load_jars!
