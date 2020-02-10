-- run in command computer
x, y, z = commands.getBlockPosition()
cX = x
cY = y
cZ = z+1

coords = cX .. " " .. cY .. " " .. cZ
cmdStr = "replaceitem block "
thingStr = " arrow 64"
rSide = "left"

function refill()
	for i=0,26,1 do
		commands.exec(cmdStr .. coords .. " slot.container." .. i .. thingStr)
	end
end

while true do
	lvl = redstone.getAnalogInput(rSide)
	if lvl == 0 then
		refill()
	end
	sleep(5)
end
