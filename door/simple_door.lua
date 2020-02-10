-- Simple script for password protecting a door

bSide = "back"

while true do
    term.clear()
    term.setCursorPos(1, 1)
    print("Please Enter Password:")
    input = read("*")
    if input == "password" then
        redstone.setBundledOutput(bSide, colors.white)
        sleep(5)
        redstone.setBundledOutput(bSide, 0)
    else
        redstone.setBundledOutput(bSide, colors.orange)
        sleep(3)
        redstone.setBundledOutput(bSide, 0)
    end
end
