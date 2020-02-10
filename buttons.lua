-- Example of using touchscreen buttons

t = {
    {text = "Button 1", x=1, y=1, txtCol=colors.red, bgCol=colors.lime},
    {text = "Button 2", x = 1, y = 2, txtCol = colours.red, bgCol = colours.lime},
    {text = "Button 3", x = 1, y = 3, txtCol = colours.red, bgCol = colours.lime}
}

mon = peripheral.wrap("top")

function writeButtons(_table)
    for i, v in pairs(_table) do
        mon.setCursorPos(v.x, v.y)
        mon.setTextColor(v.txtCol)
        mon.setBackgroundColor(v.bgCol)
        mon.write(v.text)
    end
end

function isValidClick(_table, mx, my)
    for i, v in pairs(_table) do
        if mx >= v.x and mx <= (v.x + #v.text) and my == v.y then
            return true, v.text
        end
    end
    return false, nil
end

writeButtons(t)

while true do
    _, but, x, y = os.pullEvent("monitor_touch")
    bClick, option = isValidClick(t, x, y)
    if bClick then
        -- valid click
        if option == "Button 1" then 
            redstone.setBundledOutput("back", colors.white)
        elseif option == "Button 2" then
            redstone.setBundledOutput("back", colors.orange)
        elseif option == "Button 3" then
            redstone.setBundledOutput("back", 0)
        end
    end
end

