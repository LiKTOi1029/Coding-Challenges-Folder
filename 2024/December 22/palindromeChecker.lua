io.write("Input a string: ")
local choice = string.lower(io.read())
local choiceGSubbed = string.gsub(choice, " ", "")
local choiceReversed = string.reverse(choiceGSubbed)
if choiceReversed == choiceGSubbed then
    print(true)
else
    print(false)
end