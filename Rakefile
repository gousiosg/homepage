require 'rubygems'
require 'time'
require 'find'
require 'yaml'

config = YAML::load(File.open('_config.yml'))
homedir = config['homedir']

desc "Run all pre-requisites"
task :default => [:bib, :check] do
  puts "Building dependencies"
end

desc "Check dead links"
task :default => [:] do
  puts "Building dependencies"
end

desc "Generate bib file"
task :bib do

  source = config['scholar']['source']
  bibdir = config['scholar']['bibdir']
  bibliography = config['scholar']['bibliography']

  FileUtils::mkdir_p(source) unless File.exists?(source)
  File.delete(bibliography) if File.exists?(bibliography)

  bibfile = File.open(File.join(source, bibliography), 'w')

  Find.find(bibdir) do |x|
    if x.end_with?('.bib')
      puts "Copying #{x} -> #{source}"
      FileUtils.cp(x, source)
      f = File.open(x)
      IO::copy_stream(f, bibfile)
    end
  end
  bibfile.close
end

desc "Clean up"
task :clean do
  rm_rf '_site'
  rm_rf 'courses/atse'
  rm_rf "#{config['scholar']['bibliography']}"
end
