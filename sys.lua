require('timer_class')

local sys = {}

function sys.new_timer(interval_millisec, callback)
  print("New timer created. Calling: " .. callback .. " every " .. interval_millisec)
  new_timer = timer_class(interval_millisec, callback)
  new_timer:start()
  table.insert(sys.timers, new_timer)
  return new_timer
end


function sys.time()
  return love.timer.getTime()
end


function sys.stop()
  love.event.quit()
end

sys.timers = {}

return sys