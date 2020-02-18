-- Global variables
masterID = 1
modemSide = "top"
modem = peripheral.wrap(modemSide)

-- to implement nodes in computercraft using "classes" in Lua

Node = {}
Node.__index = Node

function Node:create(rSide, id, modem)
    -- create the new object
    local node = {}
    setmetatable(node, Node)
    
    -- init the member variables
    node.rSide = rSide
    node.id = id
    node.state = "x"
    -- this is shared among the nodes
    node.modem = modem
    -- but each has its own channel
    node.modem.open(id)
    
    return node
end

-- define other functions of the Node class
function Node:sendMessage(msg)
    self.modem.transmit(masterID, self.id, msg)
end

function Node:printState()
    print(self.state .. " (" .. self.id .. ")")
end

-- redstone functions
function Node:turnOn()
	redstone.setBundledOutput(self.rSide, colors.white)
	self.state = "on"
 self:printState()
end

function Node:turnOff()
	redstone.setBundledOutput(self.rSide, colors.orange)
	self.state = "off"
 self:printState()
end

function Node:dontCare()
	redstone.setBundledOutput(self.rSide, 0)
	self.state = "x"
end

-- parse messages from the master
function Node:parseMessage(msg)
	if msg == "on" then
		self:turnOn()
	elseif msg == "off" then
		self:turnOff()
	elseif msg == "x" then
		self:dontCare()
	elseif msg == "status" then
		self:sendMessage(self.state)
	elseif msg == nil then
  print("Null message!")
 else
		print("Invalid message: " .. msg)
	end
end

-- listen on all the open channels
function receiveMessage()
    local event, mSide, senderChan, replyChan, msg, sendDist = os.pullEvent("modem_message")
    return senderChan, msg
end

-- create each of the nodes
node2 = Node:create("left", 2, modem)
node3 = Node:create("right", 3, modem)

-- make a lookup table for the nodes
nodes = {}
nodes[2] = node2
nodes[3] = node3

-- listen for messages on each channel
while true do
    chan, msg = receiveMessage()
    nodes[chan]:parseMessage(msg)
end

