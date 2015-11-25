class Clock

  include React::Component

  define_state time: Time.now

  after_mount do
    every(1) { time! Time.now }
  end

  def render
    "The time is #{time}"
  end

end
