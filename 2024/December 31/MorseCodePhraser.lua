function Determiner(userchoice, input, output)
	local firstline = input:read("*l")
	if userchoice == "GO" then --[[important code--]] end
	if string.find(firstline,"%a+") then EnglishTranslator(firstline, input, output) elseif string.find(firstline,"[-.\]") then MorseTranslator(firstline, input, output) end
end
function EnglishTranslator(firstline, input, output)
	
end
function MorseTranslator(firstline, input, output)
	
end
function ChoiceMenu()
	repeat
		print("Type anything to translate. Type GO to translate input file into output file.\nType EXIT to exit the script")
		local userchoice = io.read():gsub("\n","")
		if userchoice == "GO" then print(Determiner(userchoice, io.open("input.txt","r"), io.open("output.txt","w+")) else Determiner(userchoice) end)
	until userchoice ~= "EXIT"
end
ChoiceMenu()