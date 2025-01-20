-- I have redone this with my own code and expanded on it a bit.
function table.fuckaround(Table)
	local number = 0
	for _ in pairs(table) do
	number = number + 1
	end
	return number
end
function Phraser(input, output, replacements, replacements2)
	local Translated, isMorse, iteratedString, firstLine = nil, nil, {}, input:read("*l")
	if string.find(string.lower(firstLine), "%a+") then isMorse = false elseif string.find(firstLine, "[.-/]") then isMorse = true else isMorse = "Please type in a valid input" end
	print("Morse is "..tostring(isMorse))
	table.insert(iteratedString, firstLine)
	for line in input:lines() do
		table.insert(iteratedString, line)
	end
	if isMorse == false then
		Translated = Translator(table.concat(iteratedString), replacements)
	elseif isMorse == true then
		Translated = MorseTranslator(table.concat(iteratedString, " "), replacements2)
	end
	output:write(tostring(Translated))
	output:close()
	return "done!"
end
function MorseTranslator(input, replacements)
	local PasserString, iteratedMorse = "", {}
	for num4 = 1, input:len(), 1 do
		if input:sub(num4,num4) ~= " " then PasserString = PasserString..input:sub(num4,num4)
		else table.insert(iteratedMorse,PasserString); PasserString = ""; table.insert(iteratedMorse, " ") end
	end
	for num3, value in ipairs(iteratedMorse) do
		print(value.." | "..num3)
		table.insert(iteratedMorse, replacements[tostring(value)])
		print(iteratedMorse[num3])
	end
	return table.concat(iteratedMorse)
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
	if ReverseTable == nil then ReverseTable = {}; for value2, value in pairs(MorseTable) do ReverseTable[value] = value2; print(value.. " "..value2) end end
	io.write(">>Please refer to README.md\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input == "GO" then io.write(Phraser(io.open("input.txt", "r+"), io.open("output.txt", "w+"), MorseTable, ReverseTable).."\n")
	elseif input ~= "EXIT" then io.write(Translator(input,MorseTable).."\n") end
until input == "EXIT"