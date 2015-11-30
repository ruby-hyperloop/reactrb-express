# inline-reactive-ruby
react.rb for static sites, with no build process needed

## How To

+ Include inline-reactive-ruby.js in with your js files, or link to it from here: https://rawgit.com/reactive-ruby/inline-reactive-ruby/master/inline-reactive-ruby.js
+ Link to a version of jQuery
+ Specify your ruby code inside of `<script type="text/ruby">...</script>` tags
+ or link to your ruby code using the src attribute `<script type="text/ruby" src=.../>`

## What is included

+ Opal (Ruby to Javascript Transpiler) - currently version 0.8
+ React.rb (Ruby React.js wrapper)
+ Opal-Jquery (Ruby Jquery wrapper, including HTTP, timers, and of course DOM queries)

## How it works

Your ruby code will be compiled by the browser into javascript, and executed.  Any compilation or runtime errors
will be briefly reported to the console.

Ruby classes can mixin React::Component to become React components, and can use the React.rb
DSL to dynamically generate reactive DOM nodes.

## Example

See this example in action here: http://reactive-ruby.github.io/inline-reactive-ruby/

index.html:
```HTML
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Inline Reactive Ruby Demo</title>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="inline-reactive-ruby.js" />

    <!-- scripts can be remote or inline -->
    <script type="text/ruby" src="clock.rb"></script>

    <script type="text/ruby">
      Element["body"].render { Clock() }
    </script>

  </head>
  <body>
    <div id="clock"></div>
    <div>The time brought to you by <a href="https://github.com/reactive-ruby/inline-reactive-ruby">inline-reactive-ruby</a></div>
  </body>
</html>
```
```ruby
# clock.rb
class Clock < React::Component::Base

  before_mount do
    state.time! Time.now
    every(1) { state.time! Time.now }
  end

  def render
    "The time is #{state.time}"
  end

end
```

# Running a server

If you are an absolute beginner, you will want a server to test your code... here is how:

+ MacOS: type `python -m SimpleHTTPServer 8000` in a terminal in the same directory that your index.html file lives
+ Windows: try this link http://ccm.net/faq/2568-tinyweb-server-on-windows (not tested)

Once you are set up you should be able to go to `localhost` in your browser.

# Building and Contributing

To build, clone the repo, run `bundle install` and then `bundle exec rake`

This will combine all the pieces and build the `inline-reactive-ruby.js` file.

Contributions are welcome - things we need:

+ Examples
+ Some test cases
+ Minimization
