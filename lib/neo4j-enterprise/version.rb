module Neo4j
  module Enterprise
    VERSION = "1.6.0.alpha.1"
    NEO_VERSION = "1.6.M02"
  end

  # make sure community, advanced and enterprise neo4j jar files have the same version
  if defined?(NEO_VERSION)
    if NEO_VERSION != Enterprise::NEO_VERSION
      raise "Mismatch of Neo4j JAR versions. Already loaded JAR files #{NEO_VERSION}, neo4j-enterprise: #{Enterprise::NEO_VERSION}" 
    end
  else
    NEO_VERSION = Enterprise::NEO_VERSION
  end

end
