function string.findEnding(str)
	for num1 = 1, string.len(str), 1 do
		if string.sub(str, num1, num1+3) == ".com" or string.sub(str, num1, num1+3) == ".org" or string.sub(str, num1, num1+3) == ".net" then return string.sub(str, num1, num1+3) end
	end
	local atSign, providerName = string.match(input, "@"), string.match(input, "@%a+")
	if atSign and providerName and string.findEnding(input) then print("Valid") else print("Invalid") end
end
repeat 
io.write(">>Please input something in email syntax (EmailCheckerValidSyntax.txt): \nType EXIT to exit the script\n")
input = io.read("*l"):gsub("\n","")
until input == "EXIT"