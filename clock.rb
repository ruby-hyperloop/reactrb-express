# clock.rb:  Displays the current time
class Clock < Hyperloop::Component
  param format: '%a, %e %b %Y %H:%M'
  before_mount do
    mutate.time Time.now.strftime(params.format)
    every(1) { mutate.time Time.now.strftime(params.format) }
  end

  render do
    state.time
  end
end
