-- WIP, not yet completed

-- side that the modem is connected to the computer
modemSide = "top"
modem = peripheral.wrap(modemSide)
masterID = 1

-- lookup table for modem numbers
addresses = {}
addresses['forceField'] = 2
addresses['entranceTurret'] = 3
addresses['mainGateArrows'] = 4
addresses['mainGate'] = 5
addresses['mainGateTesla'] = 6


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
    local nextID_str = io.read()
	local nextID = tonumber(nextID_str)
    if nextID == nil then
        print("Error, not a number!")
    else
        io.write('Enter an message to send: ')
        local nextMsg = io.read()
	
        sendMessage(nextID, nextMsg)
    
        if nextMsg == "status" then
            local retMsg = receiveMessage()
            io.write('Received ' .. retMsg .. ' from computer ' .. nextID .. '\n')
        end
    io.write("\n")
    end
end
