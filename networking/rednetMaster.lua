-- WIP, not yet completed

-- side that the modem is connected to the computer
modemSide = "back"

-- get something
function getMessage()
	sender, msg = rednet.receive()
	print(sender .. ": " .. msg)
end

-- open the rednet connection
rednet.open(modemSide)

-- run in this loop detecting things forever
while true do
	getMessage()
end
