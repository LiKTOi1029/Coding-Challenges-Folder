MorseTable = {["a"] = ".-",["b"] = "-...",["c"] = "-.-.",["d"] = "-..",["e"] = ".",["f"] = "..-.",["g"] = "--.",["h"] = "....",["i"] = "..",["j"] = ".---",["k"] = "-.-",["l"] = ".-..",["m"] = "--",["n"] = "-.",["o"] = "---",["p"] = ".--.",["q"] = "--.-",["r"] = ".-.",["s"] = "...",["t"] = "-",["u"] = "..-",["v"] = "...-",["w"] = ".--",["x"] = "-..-",["y"] = "-.--",["z"] = "--..",["."] = ".-.-.-",["?"] = "..--..",["@"] = ".--.-.",["!"] = "-.-.--",["'"] = ".----.",[","] = "--..--",["\n"] = ".-.-",[" "] = "/",[":"] = "---...",[";"] = "-.-.-.",}
ReverseTable = {}; for key, value in pairs(MorseTable) do ReverseTable[value] = key; print(value.. " "..key) end
function Determiner(input, output, userchoice)
	local firstline
	if userchoice == "go" then firstline = input:read("*l") else firstline = userchoice end
	if string.find(firstline,"%a+") then return EnglishTranslator(firstline, input, output) elseif string.find(firstline,"[-.\]") then return MorseTranslator(firstline, input, output) else return "This text is invalid. If you believe this is a mistake please create an issue about it at https://github.com/LiKTOi1029/Coding-Challenges-Folder/issues" end
end
function EnglishTranslator(firstline, input, output)
	local iteratedString = {}
	for num1 = 1, firstline:len(), 1 do
		table.insert(iteratedString, MorseTable[string.lower(firstline:sub(num1,num1))])
	end
	if input and output then for str in input:lines() do
		for num3 = 1, str:len(), 1 do
				table.insert(iteratedString, MorseTable[string.lower(str:sub(num3,num3))])
			end
		end
		local result = table.concat(iteratedString, " ")
		output:write(result);output:close();input:close()
		return result
	end
	local result = table.concat(iteratedString, " ")
	return result
end
function MorseTranslator(firstline, input, output)
	local iteratedString, Parser = {}, ""
	for num4 = 1, firstline:len(), 1 do
		if firstline:sub(num4,num4) ~= " " and num4 ~= firstline:len() then Parser = Parser..firstline:sub(num4,num4)
		elseif firstline:sub(num4,num4) == " " then table.insert(iteratedString, ReverseTable[Parser]); Parser = ""
		else Parser = Parser..firstline:sub(num4,num4); table.insert(iteratedString, ReverseTable[Parser]); Parser = "" end
	end
	if input and output then for str in input:lines() do
		for num5 = 1, str:len(), 1 do 
				if str:sub(num5,num5) ~= " " and num5 ~= str:len() then Parser = Parser..str(num5,num5)
				elseif str:sub(num5,num5) == " " then table.insert(iteratedString, ReverseTable[Parser]); Parser = ""
				else Parser = Parser..str:sub(num5,num5); table.insert(iteratedString, ReverseTable[Parser]); Parser = "" end
			end
		end
		local result = table.concat(iteratedString, "")
		output:write(result);output:close();input:close()
		return result
	end
	local result = table.concat(iteratedString, "")
	return result
end
function ChoiceMenu()
	while true do
		io.flush()
		print("Type anything to translate. Type GO to translate input file into output file.\nType EXIT to exit the script")
		local userchoice = io.read():gsub("\n","")
		if userchoice == "GO" then io.write(Determiner(io.open("input.txt","r"), io.open("output.txt","w+"), string.lower(userchoice)).."\n")
		elseif userchoice == "EXIT" then return nil
		else io.write(Determiner(nil, nil, string.lower(userchoice)).."\n") end
	end
	io.flush()
end
ChoiceMenu()