# clock.rb:  Displays the current time
class Clock < React::Component::Base
  param format: '%a, %e %b %Y %H:%M'
  before_mount do
    state.time! Time.now.strftime(params.format)
    every(1) { state.time! Time.now.strftime(params.format) }
  end

  def render
    state.time
  end
end
