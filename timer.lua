require('class')


timer = class(function (self, interval_millisec, callback)
  self.interval_millisec = interval_millisec
  self.callback = callback
end)

function timer:set_interval(interval_millisec)
  self.interval_millisec = interval_millisec
end

function timer:stop()
  
end

function timer:start()
  
end

-- timer:set_interval()
--   Changes the interval

-- timer:stop()
--   No more callbacks are generated, even if a timer timeout already
--   happened and was waiting for dispatching.

-- timer:start()
--   The timer starts generating callbacks at the prescribed interval, if
--   previously stopped.