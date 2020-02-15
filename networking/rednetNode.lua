-- WIP, not yet completed

-- side that the modem is connected to the computer
modemSide = "top"
modem = peripheral.wrap(modemSide)
masterID = 1
-- change this for each one
thisID = 2
-- side the bundled cable is connected to
rSide = "left"
state = 'x'

-- sends a message to the master computer
function sendMessage(msg)
	modem.transmit(masterID, thisID, msg)
end

-- receive messages
function receiveMessage()
	local event, mSide, senderChan, replyChan, msg, sendDist = os.pullEvent("modem_message")
	return msg
end

-- functionsn to control the redstone
function turnOn()
	print("on")
	redstone.setBundledOutput(rSide, colors.white)
	state = "on"
end

function turnOff()
	print("off")
	redstone.setBundledOutput(rSide, colors.orange)
	state = "off"
end

function dontCare()
	redstone.setBundledOutput(rSide, 0)
	state = "x"
end

-- parse messages from the master
function parseMessage(msg)
	if msg == "on" then
		turnOn()
	elseif msg == "off" then
		turnOff()
	elseif msg == "x" then
		dontCare()
	elseif msg == "status" then
		sendMessage(state)
	else
		print("Invalid message: " .. msg)
	end
end


-- open the modem/rednet connection
modem.open(thisID)

-- run in this loop receiving messages forever
while true do
	msg = receiveMessage()
	parseMessage(msg)
end
