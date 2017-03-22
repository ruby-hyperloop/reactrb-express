require 'hyperloop-config'
require 'rubygems'
require 'opal-rails'
require 'hyper-operation'
require 'opal-browser'
require 'opal-jquery'
require 'uglifier'

desc 'Build reactrb express'
task :build do
  Opal.append_path 'reactrb-express'
  File.binwrite 'reactrb-express.js', Opal::Builder.build('application').to_s
end

desc 'Minify using uglifier gem'
task :minify do
  js_file = "reactrb-express.js"
  js_min_file = "reactrb-express.min.js"
  File.open(js_min_file, "w").write(Uglifier.new.compile(File.read(js_file)))
end
task default: [:build, :minify]
