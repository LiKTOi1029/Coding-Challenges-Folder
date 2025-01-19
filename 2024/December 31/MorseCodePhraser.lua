-- I have redone this with my own code and expanded on it a bit.
function Translator(temporaryinput,replacements)
	local input = temporaryinput:lower()
	local iteratedString = {}
	for num1 = 1, input:len(), 1 do
		table.insert(iteratedString, input:sub(num1,num1))
	end
	for num2, value in ipairs(iteratedString) do
		if replacements[value] == nil then iteratedString[num2] = "#"
		else iteratedString[num2] = replacements[value] end
		print(tostring(iteratedString[num2]))
	end
	local output = table.concat(iteratedString, " ")
	return output
end
repeat
	local MorseTable = {["a"] = ".-",
						["b"] = "-...",
						["c"] = "-.-.",
						["d"] = "-..",
						["e"] = ".",
						["f"] = "..-.",
						["g"] = "--.",
						["h"] = "....",
						["i"] = "..",
						["j"] = ".---",
						["k"] = "-.-",
						["l"] = ".-..",
						["m"] = "--",
						["n"] = "-.",
						["o"] = "---",
						["p"] = ".--.",
						["q"] = "--.-",
						["r"] = ".-.",
						["s"] = "...",
						["t"] = "-",
						["u"] = "..-",
						["v"] = "...-",
						["w"] = ".--",
						["x"] = "-..-",
						["y"] = "-.--",
						["z"] = "--..",
						["."] = "-.-.-.",
						["?"] = "..--..",
						["@"] = ".--.-.",
						["!"] = "-.-.--",
						["'"] = ".----.",
						[","] = "--..--",
						["\n"] = ".-.-",
						[" "] = "/",
						[":"] = "---..."}
	io.write(">>Please refer to Guide.txt\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input ~= "EXIT" then io.write(Translator(input,MorseTable).."\n") end
until input == "EXIT"