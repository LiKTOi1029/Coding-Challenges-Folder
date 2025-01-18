local choice = string.lower(read())
local choiceGSubbed = string.gsub(choice, " ", "")
local choiceReversed = string.reverse(choiceGSubbed)
if choiceReversed == choiceGSubbed then
    print(true)
else
    print(false)
end

--[[
This was made in CraftOS-PC emulator lua. Not vanilla. Please use that when executing
OR
Replace 'local choice = string.lower(read())' with 'local choice = string.lower(io.read())
--]]