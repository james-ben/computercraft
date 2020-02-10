-- disable Ctrl-T
local pullEventBackup = os.pullEvent
os.pullEvent = os.pullEventRaw
-- side it's connected to the bundled cable
bSide = "back"
 
-- door password
pswd = "password"
admn = "admin"
 
while true do
    term.clear()
    term.setCursorPos(1, 1)
    print("Please Enter Password:")
    input = read("*")
    if input == pswd then
        redstone.setBundledOutput(bSide, colors.white)
        sleep(5)
        redstone.setBundledOutput(bSide, 0)
    elseif input == admn then
        break
    else
        redstone.setBundledOutput(bSide, colors.orange)
        sleep(3)
        redstone.setBundledOutput(bSide, 0)
    end
end
 
-- restore the event stuff
os.pullEvent = pullEventBackup
-- now the code exits and you can edit the computer
