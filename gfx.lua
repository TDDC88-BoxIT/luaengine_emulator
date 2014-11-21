require('surface_class')

local gfx = {}

function gfx.set_auto_update(bool)
  gfx.auto_update = bool
end


function gfx.new_surface(width, height)
  gfx.memory_use = gfx.memory_use + (width*height*4)
  return surface_class(width, height)
end


function gfx.get_memory_use()
  return gfx.memory_use
end


screen = surface_class(love.graphics.getDimensions())


function gfx.get_memory_limit()
  -- Taken from the box
  return 10485760
end


function gfx.update()
  --print('Called draw')
  buffer_screen = screen
end


function gfx.loadpng(path)
  return gfx.loadjpeg(path)
end


function gfx.loadjpeg(path)
  image = love.graphics.newImage(path)
  surface = surface_class(image:getDimensions())
  gfx.memory_use = gfx.memory_use + (image:getWidth()*image:getHeight()*4)
  love.graphics.setCanvas(surface.canvas)
  love.graphics.setColor(check_color({255,255,255,255}))
  --love.graphics.setBlendMode('premultiplied')
  love.graphics.draw(image)
  love.graphics.setCanvas()
  return surface
end


----------------------
-- Helper variables --
----------------------

gfx.auto_update = false
gfx.memory_use = 3686400

return gfx
