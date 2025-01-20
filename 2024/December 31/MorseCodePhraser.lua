-- I have redone this with my own code and expanded on it a bit.
function Phraser(input, output, replacements, replacements2)
	local Translated, isMorse, iteratedString, firstLine = nil, nil, {}, input:read("*l")
	if string.find(firstLine, "[.-/]")then isMorse = true else isMorse = false end
	print("Morse is "..tostring(isMorse))
	table.insert(iteratedString, firstLine)
	for line in input:lines() do
		table.insert(iteratedString, line)
	end
	if isMorse == false then
		Translated = Translator(table.concat(iteratedString), replacements)
	elseif isMorse == true then
		Translated = Translator(table.concat(iteratedString), replacements2)
	end
	output:write(Translated)
	output:close()
	return "done!"
end
function Translator(temporaryinput,replacements)
	local input = temporaryinput:lower()
	local iteratedString = {}
	for num1 = 1, input:len(), 1 do
		table.insert(iteratedString, input:sub(num1,num1))
	end
	for num2, value in ipairs(iteratedString) do
		if replacements[value] == nil then iteratedString[num2] = "#"
		else iteratedString[num2] = replacements[value] end
	end
	local output = table.concat(iteratedString, " ")
	return output
end
repeat
	local MorseTable = {["a"] = ".-",["b"] = "-...",["c"] = "-.-.",["d"] = "-..",["e"] = ".",["f"] = "..-.",["g"] = "--.",["h"] = "....",["i"] = "..",["j"] = ".---",["k"] = "-.-",["l"] = ".-..",["m"] = "--",["n"] = "-.",["o"] = "---",["p"] = ".--.",["q"] = "--.-",["r"] = ".-.",["s"] = "...",["t"] = "-",["u"] = "..-",["v"] = "...-",["w"] = ".--",["x"] = "-..-",["y"] = "-.--",["z"] = "--..",["."] = ".-.-.-",["?"] = "..--..",["@"] = ".--.-.",["!"] = "-.-.--",["'"] = ".----.",[","] = "--..--",["\n"] = ".-.-",[" "] = "/",[":"] = "---...",[";"] = "-.-.-."}
	if ReverseTable == {} then local ReverseTable = {}; for value2, value in pairs(MorseTable) do ReverseTable[value] = value2 end end
	io.write(">>Please refer to README.md\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input == "GO" then io.write(Phraser(io.open("input.txt", "r+"), io.open("output.txt", "w+"), MorseTable, ReverseTable).."\n")
	elseif input ~= "EXIT" then io.write(Translator(input,MorseTable).."\n") end
until input == "EXIT"