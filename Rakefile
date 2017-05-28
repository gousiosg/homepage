require 'rubygems'
require 'time'
require 'find'
require 'yaml'

config = YAML::load(File.open('_config.yml'))

desc "Run all pre-requisites"
task :default => [:bib, :courses] do
  puts "Building dependencies"
end

#desc "Check dead links"
#task :default => [:] do
#  puts "Building dependencies"
#end

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

desc "Prepare course slides"
task :courses do
  config['courses'].each do |c|
    sh "d=`pwd` && mkdir -p courses/#{c[0]} && cd #{c[1]} && make -j 4 && find . -type f |grep .nb.html|xargs -Istr cp str $d/courses/#{c[0]}/ && find . -type f |grep .pdf |xargs -Istr cp str $d/courses/#{c[0]}/  && cd $d"
  end
end

desc "Clean up"
task :clean do
  rm_rf '_site'
  rm_rf 'courses/atse'
  rm_rf "#{config['scholar']['bibliography']}"
end
