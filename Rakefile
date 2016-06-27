require 'rubygems'
require 'opal'
require 'opal-browser'
require 'reactrb'
require 'opal-jquery'

desc 'Build inline code editor support reactive-playground.js'
task :build do
  Opal.append_path 'reactrb-express'
  File.binwrite 'reactrb-express.js', Opal::Builder.build('application').to_s
end

task default: [:build]
