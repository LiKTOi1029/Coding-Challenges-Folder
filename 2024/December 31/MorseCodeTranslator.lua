MorseTable, PermaTable = {["a"] = ".-",["b"] = "-...",["c"] = "-.-.",["d"] = "-..",["e"] = ".",["f"] = "..-.",["g"] = "--.",["h"] = "....",["i"] = "..",["j"] = ".---",["k"] = "-.-",["l"] = ".-..",["m"] = "--",["n"] = "-.",["o"] = "---",["p"] = ".--.",["q"] = "--.-",["r"] = ".-.",["s"] = "...",["t"] = "-",["u"] = "..-",["v"] = "...-",["w"] = ".--",["x"] = "-..-",["y"] = "-.--",["z"] = "--..",["."] = ".-.-.-",["?"] = "..--..",["@"] = ".--.-.",["!"] = "-.-.--",["'"] = ".----.",[","] = "--..--",["\n"] = ".-.-",[" "] = "/",[":"] = "---...",[";"] = "-.-.-.",}, {[">||<"] = "\n",}
ReverseTable = {}; for key, value in pairs(MorseTable) do ReverseTable[value] = key; print(value.. " "..key) end
function Determiner(userchoice, input, output)
	local firstline
	if userchoice == "GO" then firstline = input:read("*l") else firstline = userchoice end
	if string.find(firstline,"%a+") then EnglishTranslator(firstline, input, output) elseif string.find(firstline,"[-.\]") then MorseTranslator(firstline, input, output) else print("This text is invalid. If you believe this is a mistake please create an issue about it at https://github.com/LiKTOi1029/Coding-Challenges-Folder/issues") end
end
function EnglishTranslator(firstline, input, output)
	local iteratedString = {}
	for num1 = 1, firstline:len(), 1 do
		table.insert(iteratedString, MorseTable[firstline:sub(num1,num1)])
		print(iteratedString[num1])
	end
	if input and output then for num2, str in input:lines() do 
		table.insert(iteratedString, MorseTable[str])
		end
	end
	local result = table.concat(iteratedString, " ")
	return result
end
function MorseTranslator(firstline, input, output)
	
end
function ChoiceMenu()
	repeat
		io.flush()
		print("Type anything to translate. Type GO to translate input file into output file.\nType EXIT to exit the script")
		local userchoice = io.read():gsub("\n","")
		if userchoice == "GO" then io.write(Determiner(userchoice, io.open("input.txt","r"), io.open("output.txt","w+"))) else io.write(Determiner(userchoice)) end
	until userchoice == "EXIT"
	io.flush()
end
ChoiceMenu()