require "bundler/gem_tasks"

def source_file
  gz_file = Dir.new('tmp').entries.find { |x| x =~ /gz$/ }
  File.expand_path("./tmp/#{gz_file}")
end

def unpack_lib_dir
  gz_file = Dir.new('tmp').entries.find { |x| x =~ /gz$/ }
  dir = gz_file.gsub('-unix.tar.gz', '')
  File.expand_path("./tmp/#{dir}/lib")
end

def jar_files_to_copy
  Dir.new(unpack_lib_dir).entries.find_all {|x| x =~ /\.jar/}
end

desc "Delete old Jar files"
task :delete_old_jar do
  root = File.expand_path("./lib/neo4j-enterprise/jars")
  files = Dir.new(root).entries.find_all{|f| f =~ /\.jar/}
  files.each do |file|
    system "git rm #{root}/#{file}" unless file.start_with?('log4j')
  end
end

def include_jar?(file)
  include_only = %w[log4j neo4j-backup neo4j-com neo4j-enterprise neo4j-ha org.apache.servicemix.bundles.netty slf4j zookeeper]
  include_only.each do |i|
    return true if file.start_with?(i) 
  end
  false
end

desc "Upgrade using downloaded ...tar.gz file in ./tmp"
task :upgrade => [:delete_old_jar] do
  system "cd tmp; tar xf #{source_file}"
  jars = File.expand_path("./lib/neo4j-enterprise/jars")
  jar_files_to_copy.each {|f| system "cp #{unpack_lib_dir}/#{f} #{jars}" if include_jar?(f)}
end