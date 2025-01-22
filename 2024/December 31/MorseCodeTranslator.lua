MorseTable, PermaTable = {["a"] = ".-",["b"] = "-...",["c"] = "-.-.",["d"] = "-..",["e"] = ".",["f"] = "..-.",["g"] = "--.",["h"] = "....",["i"] = "..",["j"] = ".---",["k"] = "-.-",["l"] = ".-..",["m"] = "--",["n"] = "-.",["o"] = "---",["p"] = ".--.",["q"] = "--.-",["r"] = ".-.",["s"] = "...",["t"] = "-",["u"] = "..-",["v"] = "...-",["w"] = ".--",["x"] = "-..-",["y"] = "-.--",["z"] = "--..",["."] = ".-.-.-",["?"] = "..--..",["@"] = ".--.-.",["!"] = "-.-.--",["'"] = ".----.",[","] = "--..--",["\n"] = ".-.-",[" "] = "/",[":"] = "---...",[";"] = "-.-.-.",}, {[">||<"] = "\n",}
ReverseTable = {}; for key, value in pairs(MorseTable) do ReverseTable[value] = key; print(value.. " "..key) end
function Determiner(input, output, userchoice)
	local firstline
	if userchoice == "GO" then firstline = input:read("*l") else firstline = userchoice end
	if string.find(firstline,"%a+") then EnglishTranslator(firstline, input, output) elseif string.find(firstline,"[-.\]") then MorseTranslator(firstline, input, output) else print("This text is invalid. If you believe this is a mistake please create an issue about it at https://github.com/LiKTOi1029/Coding-Challenges-Folder/issues") end
end
function EnglishTranslator(firstline, input, output)
	local iteratedString = {}
	if firstline ~= "GO" then
		for num1 = 1, firstline:len(), 1 do
			table.insert(iteratedString, MorseTable[string.lower(firstline:sub(num1,num1))])
		end
	end
	if input and output and firstline == "GO" then for num2, str in input:lines() do
		print(tostring(str))
		for num3 = 1, str:len(), 1 do
				table.insert(iteratedString, MorseTable[string.lower(str:sub(num1,num1))])
			end
		end
		local result = table.concat(iteratedString, " ")
		output:write(result);output:close();input:close()
		return result
	end
	print(firstline)
	return tostring(firstline)
end
function MorseTranslator(firstline, input, output)
	
end
function ChoiceMenu()
	repeat
		io.flush()
		print("Type anything to translate. Type GO to translate input file into output file.\nType EXIT to exit the script")
		local userchoice = io.read():gsub("\n","")
		if userchoice == "GO" then io.write(Determiner(io.open("input.txt","r"), io.open("output.txt","w+"), string.lower(userchoice))) else io.write(Determiner(nil, nil, string.lower(userchoice))) end
	until userchoice == "EXIT"
	io.flush()
end
ChoiceMenu()