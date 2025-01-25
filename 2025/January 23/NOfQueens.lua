function table.replace(tab, originalLocation, replacement)
table.remove(tab, originalLocation); table.insert(tab, originalLocation, replacement)
return tab
end
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
	local num6, verticalAxis = 1, nil
	for rank, rows in ipairs(chessboard) do -- This iterates over every single horizontal row on the chessboard
		for file, squares in ipairs(rows) do -- This iterates over every single square in every horizontal row (I names the int value "file" because it is really just iterating through the vertical columns or "files" on the chessboard
			table.replace(rows, rows[file], "Q") -- This is a custom function that replaces one object in a table with another
			for num5 = rank, 1, -1 do -- This iterates over every rank starting from the position of the current queen upwards. This mainly just checks if there is a queen in line of sight of this particular queen
				verticalAxis = chessboard[num5]
				if verticalAxis[file] == "Q" then break --Queens are represented with Q
				elseif verticalAxis[file+num6] == "Q" then break
				elseif verticalAxis[file-num6] == "Q" then break end
				num6=num6+1
			end
			num6 = 1
			for num7 = rank, #chessboard, 1 do
				verticalAxis = chessboard[num7]
				if verticalAxis[file] == "Q" then break
				elseif verticalAxis[file+num6] == "Q" then break
				elseif verticalAxis[file-num6] == "Q" then break end
				num6=num6+1
			end
			if file < #rows then table.replace(rows, rows[file], "X") end --Empty squares are represented with X
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