-- I have redone this with my own code and expanded on it a bit.
function Translator(input,replacements)
	
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
						["\n"] = ".-.-"}
	io.write(">>Please type GO to convert files. Please refer to Guide.txt\n>>Type EXIT to exit the script.\n")
	local input = io.read("*l"):gsub("\n","")
	if input ~= "EXIT" then Translator(input,MorseTable) end
until input == "EXIT"