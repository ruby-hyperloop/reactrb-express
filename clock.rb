class Clock < React::Component::Base

  before_mount do
    state.time! Time.now
    every(1) { state.time! Time.now }
  end

  def render
    "The time is #{state.time}"
  end

end
