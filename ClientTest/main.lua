-- Client test
this is a test 

require "enet"

function love.load()
	host = enet.host_create()
	server = host:connect("localhost:6789")
end

function love.update( dt )
	local event = host:service(100)
	if event then
		if event.type == "connect" then
			print("Connected to", event.peer)
			event.peer:send("hello world")
		elseif event.type == "receive" then
			print("Got message: ", event.data, event.peer)
			love.event.quit()
		end
	end
end

function love.draw()
	love.graphics.print("Hello World!", 400, 300)
end
