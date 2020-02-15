-- WIP, not yet completed

-- side that the modem is connected to the computer
modemSide = "top"
modem = peripheral.wrap(modemSide)
masterID = 1
-- lookup table for modem numbers
forceFieldID = 2

-- sends a message to the master computer
-- see https://computercraft.info/wiki/Modem.transmit
--  for instructions on how to send a table
function sendMessage(id, msg)
	modem.transmit(id, masterID, msg)
end

-- receive messages
function receiveMessage()
	local event, mSide, senderChan, replyChan, msg, sendDist = os.pullEvent("modem_message")
	return msg
end


-- open the modem/rednet connection
modem.open(masterID)

-- run in this loop detecting things forever
while true do
	io.write('Enter an ID to connect to: ')
	local nextID = io.read("*n")
	io.write('\nEnter an message to send: ')
	local nextMsg = io.read()
	
	sendMessage(nextID, nextMsg)
	local retMsg = receiveMessage()
	
	io.write('Received ' .. retMsg .. ' from computer ' .. nextID .. '\n')
end
