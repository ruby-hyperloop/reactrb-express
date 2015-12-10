require 'opal'
require 'opal/compiler'
require 'browser'
require 'browser/socket'
require 'browser/interval'
require 'browser/delay'
require 'opal-jquery'
require 'reactive-ruby'

Document.ready? do
  code = []
  promises = []
  Element['script[type="text/ruby"]'].each_with_index do |script_tag, index|
    if src = script_tag.attr('src')
      promises << HTTP.get(src).then do |response|
        code[index] = response.body
      end
    else
      code[index] = script_tag.html
    end
  end
  Promise.when(*promises).then do
    compiled_code = nil
    begin
      compiled_code = Opal::Compiler.new(code.join("\n")).compile
    rescue Exception => e
      message = "Error raised while compiling: #{e.message}"
      `console.error(message)`
    end
    begin
      `eval(compiled_code)` if compiled_code
    rescue Exception => e
      message = "Error raised during execution: #{e.message}"
      `console.error(message)`
    end
  end
end
