-- Server test

require "enet"

function love.load()
	host = enet.host_create("*:6789")
end

function love.update( dt )
	local event = host:service(100)
	if event and event.type == "receive" then
		print("Got message: ", event.data, event.peer)
		event.peer:send(event.data)
	end
end

function love.draw()
	love.graphics.print("Hello World!", 400, 300)
end