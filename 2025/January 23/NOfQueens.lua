function chessboardbuilder(input)
	local wholeboard = {}
	for num1 = 1, input, 1 do
		local newtable = {}
		for num2 = 1, input, 1 do
			table.insert(newtable, "X")
			io.write(newtable[num2])
		end
		io.write("\n")
		wholeboard[num1] = newtable
	end
end
repeat
	io.write("Please input an integer! Input EXIT to exit the script\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and (choice:find("%a+") or not choice:find("%d")) then io.write("Please input a valid number\n")
	elseif choice ~= "EXIT" and not choice:find("%a+") then chessboardbuilder(choice) end
until choice == "EXIT"