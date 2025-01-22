function Determiner(userchoice, input, output)
	
end
function EnglishTranslator()
	
end
function MorseTranslator()
	
end
function ChoiceMenu()
	repeat
		print("Type anything to translate. Type GO to translate input file into output file.\nType EXIT to exit the script")
		local userchoice = io.read():gsub("\n","")
		if userchoice == "GO" then Determiner(userchoice, io.open("input.txt","r"), io.open("output.txt","w+")) else Determiner(userchoice) end
	until userchoice ~= "EXIT"
end
ChoiceMenu()