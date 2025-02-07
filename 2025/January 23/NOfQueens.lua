function chessboardbuilder(input)
	local wholeboard = {}
	for num1 = 1, input, 1 do
		local newtable = {}
		for num2 = 1, input, 1 do
			if num2 == 1 then table.insert(newtable, "Q")
			else table.insert(newtable, "X") end
			io.write(newtable[num2])
		end
		io.write("\n")
		wholeboard[num1] = newtable
	end
	return queens(wholeboard,input)
end
function queens(chessboard,input)
	local num6 = 1
	for num3, rows in ipairs(chessboard) do
		for num4, squares in ipairs(rows) do
			squares = "Q"
			for num5 = num3, 1, -1 do
				if chessboard[num5[num4]] == "Q" then break
				elseif chessboard[num5[num4+num6]] == "Q" then break
				elseif chessboard[num5[num4-num6]] == "Q" then break end
				num6=num6+1
			end
			num6 = 1
			for num7 = num3, #chessboard, 1 do
				if chessboard[num5[num4]] == "Q" then break
				elseif chessboard[num5[num4+num6]] == "Q" then break
				elseif chessboard[num5[num4+num6]] == "Q" then break end
				num6=num6+1
			end
			squares = "X"
		end
	end
	return chessboard
end
repeat
	io.write("Please input an integer! Input EXIT to exit the script\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and (choice:find("%a+") or not choice:find("%d")) then io.write("Please input a valid number\n")
	elseif choice ~= "EXIT" and not choice:find("%a+") then chessboardbuilder(choice) end
until choice == "EXIT"