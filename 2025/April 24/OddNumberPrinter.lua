function OddNumberPrinter(choice)
	for num1 = 0, choice, 1 do
		if num1 % 2 == 1 then io.write(num1.." ") end
	end
	io.write("\n")
end
repeat 
	io.write("type in a number ceiling\ntype exit to exit\n")
	local choice = io.read("*l"):gsub("\n", "")
	if choice:lower() ~= "exit" then OddNumberPrinter(choice) end
until choice:lower() == "exit"