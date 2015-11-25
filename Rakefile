require 'rubygems'
require 'opal'
require 'opal-browser'
require 'reactive-ruby'
require 'opal-jquery'

desc "Build inline code editor support reactive-playground.js"
task :build do
  Opal.append_path "inline-reactive-ruby"
  File.binwrite "inline-reactive-ruby.js", Opal::Builder.build("application").to_s
end

task :default => [:build]
