require 'rubygems'
require 'time'
require 'find'
require 'yaml'

config = YAML::load(File.open('_config.yml'))
homedir = config['homedir']

desc "Run all pre-requisites"
task :default => [:bib, :atse] do
  puts "Building dependencies"
end

desc "Import the Advanced Software Engineering lab notes"
task :atse do
  src = "#{homedir}/Documents/Misc/labs/isrm/Makefile"
  target = 'courses/atse/index.md'
  unless uptodate?(target, [src])
    mkdir_p(File.dirname target)
    old = FileUtils.pwd
    cd File.dirname src
    sh "make html" or fail
    cd old
    Find.find(File.join((File.dirname src), 'html')) do |f|
      next if File.directory?(f)
      cp f, File.dirname(target)
    end
  end
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
