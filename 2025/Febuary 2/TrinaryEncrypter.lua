function Tabler(Input)
	if Input ~= "ENCRYPT" or Input ~= "DECRYPT" then Tabler(Input, true) elseif Input == "ENCRYPT" or Input == "DECRYPT" then Tabler(Input, false) end
	
end
repeat 
	io.write("ENCRYPT to encrypt, DECRYPT to decrypt, EXIT to exit.")
	local choice = io.read("*l"):gsub("\n", "")
until choice == "EXIT"