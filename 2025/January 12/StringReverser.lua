wordList, setString, userInput = {}, "", io.read()
function reverse(Table)
    for num1 = 1, math.floor(#Table / 2) do
        Table[num1], Table[#Table - num1 + 1] = Table[#Table - num1 + 1], Table[num1]
    end
    return Table
end
for num0 = 1, string.len(userInput), 1 do
	if string.sub(userInput, num0, num0) ~= " " then
		local putTogetherString = string.sub(userInput,num0,num0)
		setString = setString..putTogetherString
	end
	if string.sub(userInput, num0, num0) == " " or num0 == string.len(userInput) then
		table.insert(wordList, setString)
		setString = ""
	end
end
reverse(wordList)
for num2 = 1, #wordList, 1 do
	setString = setString.." "..wordList[num2]
end
print(setString)