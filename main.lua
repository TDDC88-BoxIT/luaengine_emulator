require('surface')

----------------------
-- love2d functions --
----------------------

function love.load()
  --print('love.load')
  image = love.graphics.newImage("tv_picture.jpg")
  love.keyboard.setKeyRepeat(true)
  first_run = true
  
  key_translation = {}
  --key_translation[keyboard] = stb
  key_translation["0"] = "0"
  key_translation["1"] = "1"
  key_translation["2"] = "2"
  key_translation["3"] = "3"
  key_translation["4"] = "4"
  key_translation["5"] = "5"
  key_translation["6"] = "6"
  key_translation["7"] = "7"
  key_translation["8"] = "8"
  key_translation["9"] = "9"
  key_translation[" "] = "ok"
  key_translation["up"] = "up"
  key_translation["down"] = "down"
  key_translation["left"] = "left"
  key_translation["right"] = "right"
  key_translation["q"] = "red"
  key_translation["w"] = "green"
  key_translation["e"] = "yellow"
  key_translation["r"] = "blue"
  key_translation["t"] = "white"
  key_translation["i"] = "info"
  key_translation["lshift"] = "menu"
  key_translation["g"] = "guide"
  key_translation["o"] = "opt"
  key_translation["h"] = "help"
  key_translation["s"] = "star"
  key_translation["a"] = "multi"
  key_translation["x"] = "exit"
  key_translation["p"] = "pause"
  key_translation["z"] = "toggle_tv_radio"
  key_translation["c"] = "record"
  key_translation["v"] = "play"
  key_translation["b"] = "stop"
  key_translation["n"] = "fast_forward"
  key_translation["m"] = "rewind"
  key_translation[","] = "skip_forward"
  key_translation["."] = "skip_reverse"
  key_translation["-"] = "jump_to_end"
  key_translation["rshift"] = "jump_to_beginning"
  key_translation["l"] = "toggle_pause_play"
  key_translation["k"] = "vod"
  key_translation["backspace"] = "backspace"
  key_translation["j"] = "hash"
  key_translation["'"] = "back"
  key_translation["+"] = "ttx"
  key_translation["d"] = "record_list"
  key_translation["f"] = "play_list"
  key_translation["u"] = "mute"
end


function love.draw()
  --print('love.draw')
  if first_run then
    if type(onStart) == "function" then
      print('Calling onStart')
      onStart()
    end
    first_run = false
  end
  --love.graphics.setColor(0, 255, 0, 255)
  love.graphics.draw(image)
  love.graphics.circle( "fill", 300, 300, 50, 100 )
  love.graphics.print("Hello World!", 400, 300)
end


function love.keypressed(key, isrepeat)
  if isrepeat then
    state = "repeat"
  else
    state = "down"
  end
  
  if key_translation[key] ~= nil and type(onKey) == "function" then
    print("Keybord key: " .. key .. ", STB key: " .. key_translation[key] .. ", state: " .. state )
    onKey(key_translation[key], state)
  end
end

function love.keyreleased(key)
  if key_translation[key] ~= nil and type(onKey) == "function" then
    print("Keybord key: " .. key .. ", STB key: " .. key_translation[key] .. ", state: up")
    onKey(key_translation[key], "up")
  end
end

--function onStart()
--  print("Start")
--end