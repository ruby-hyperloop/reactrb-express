# clock.rb:  Displays the current time
class Clock < Hyperloop::Component
  param format: '%a, %e %b %Y %H:%M'
  before_mount do
    mutate.time Time.now.strftime(params.format)
    every(60) { mutate.time Time.now.strftime(params.format) }
  end

  render do
    "#{state.time} - last message: #{TestStore.message}"
  end
end

class TestOperation < Hyperloop::Operation
  param :message
  step { params.message = params.message * 2 }
end

class TestStore < Hyperloop::Store
  state :message, scope: :class,  reader: true
  receives(TestOperation) { |params| mutate.message params.message }
end
