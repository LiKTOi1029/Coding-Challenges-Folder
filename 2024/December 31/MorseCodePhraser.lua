function Phraser(input, output, replacements, replacements2, permaplacements)
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
		Translated = MorseTranslator(table.concat(iteratedString, " "), replacements2, permaplacements)
	end
	output:write(tostring(Translated))
	output:close()
	
	return "done!"
end
function MorseTranslator(input, replacements)
	local PasserString, iteratedMorse, iteratedMorseSecondEdition = "", {}, {}
	print(input)
	for num4 = 1, input:len(), 1 do
		if input:sub(num4,num4) ~= " " then PasserString = PasserString..input:sub(num4,num4); print(input:sub(num4,num4))
		elseif input:sub(num4,num4) == " " or num4 == input:len() then table.insert(iteratedMorse, PasserString); print(PasserString); PasserString = "" end
	end
	for num3 = 1, #iteratedMorse, 1 do
		if iteratedMorse[num3] then table.insert(iteratedMorseSecondEdition, replacements[iteratedMorse[num3]]); print(table.concat(iteratedMorseSecondEdition).." | "..tostring(replacements[iteratedMorse[num3]])) end
		print(tostring(iteratedMorse[num3]))
	end
	return table.concat(iteratedMorseSecondEdition)
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
	local MorseTable, PermaTable = {["a"] = ".-",["b"] = "-...",["c"] = "-.-.",["d"] = "-..",["e"] = ".",["f"] = "..-.",["g"] = "--.",["h"] = "....",["i"] = "..",["j"] = ".---",["k"] = "-.-",["l"] = ".-..",["m"] = "--",["n"] = "-.",["o"] = "---",["p"] = ".--.",["q"] = "--.-",["r"] = ".-.",["s"] = "...",["t"] = "-",["u"] = "..-",["v"] = "...-",["w"] = ".--",["x"] = "-..-",["y"] = "-.--",["z"] = "--..",["."] = ".-.-.-",["?"] = "..--..",["@"] = ".--.-.",["!"] = "-.-.--",["'"] = ".----.",[","] = "--..--",["\n"] = ".-.-",[" "] = "/",[":"] = "---...",[";"] = "-.-.-.",}, {[">||<"] = "\n",}
	if ReverseTable == nil then ReverseTable = {}; for value2, value in pairs(MorseTable) do ReverseTable[value] = value2; print(value.. " "..value2) end end
	io.write(">>Please refer to README.md\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input == "GO" then io.write(Phraser(io.open("input.txt", "r+"), io.open("output.txt", "w+"), MorseTable, ReverseTable, PermaTable).."\n")
	elseif input ~= "EXIT" then io.write(Translator(input,MorseTable).."\n") end
until input == "EXIT"
--[[
KNOWN BUGS:
1. Cannot translate new lines into notepad causing inconsistencies
2. Cannot translate from morse to english in the terminal, must be done in file format
3. Cannot edit input.txt while terminal is open. This is invoncenient
--]]