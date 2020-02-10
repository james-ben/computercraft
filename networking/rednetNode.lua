-- WIP, not yet completed

-- side that the modem is connected to the computer
modemSide = "back"
masterID = 1

-- sends a message to the master computer
function sendMessage(msg)
	rednet.send(masterID, msg)
end

-- function to detect something - depends on the node
function detect()
	if false then
		return true
	else
		return false
	end
end

-- open the rednet connection
rednet.open(modemSide)

-- run in this loop detecting things forever
while true do
	if detect() then
		sendMessage("hello there")
	end
end
