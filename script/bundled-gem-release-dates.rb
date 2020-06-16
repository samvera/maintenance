require 'open3'
require 'psych'

# Read through the current directories list of bundled gems. Capture
# each gem's specification. Sort the specifications by version release
# date, and print one line per gem. Note, this takes some time to run.
#
# Example:
#
#   2020-06-11  1.40.0  rubocop-rspec
#   2020-06-11  1.329.0 aws-partitions
#   2020-06-12  3.99.2  aws-sdk-core
#   2020-06-12  1.0.1   ldp

specifications = []

Open3.popen3("bundle list --name-only") do |i,o,e,w|
  o.read.chomp.split("\n").each do |line|
    Open3.popen3("gem specification #{line}") do |stdin, stdout, stderr, wait_thr|
      next unless wait_thr.value.success?
      yaml  = stdout.read.chomp
      specifications << Psych.load(yaml)
    end
  end
end

puts "DATE\tVERSION\tGEM_NAME"
specifications.sort {|a, b| a.date <=> b.date }.each do |spec|
  puts "#{spec.date.strftime('%Y-%m-%d')}\t#{spec.version}\t#{spec.name}"
end
