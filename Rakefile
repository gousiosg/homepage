require 'rubygems'
require 'time'
require 'find'
require 'yaml'

desc "Generate bib file"
task :bib do
 
  config = YAML::load(File.open('_config.yml'))
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
  rm_rf _site
end
