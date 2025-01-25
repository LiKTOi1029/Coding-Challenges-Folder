function queencounter(queenpos)
	for _, num1 in ipairs(queenpos) do if num1 ~= #queenpos then return false end end
	return true
end
--[[function queenchecker()
	table.replace(rows, rows[file], "Q")
	for num5 = rank, 1, -1 do
		verticalAxis = chessboard[num5]
		if verticalAxis[file] == "Q" then break
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
	if file < #rows then table.replace(rows, rows[file], "X") end
end--]]
function table.replace(tab, originalLocation, replacement)
	table.remove(tab, originalLocation); table.insert(tab, originalLocation, replacement)
	return tab
end
function chessboardbuilder(input)
	local wholeboard = {}
	for num1 = 1, input, 1 do
		local queenpos = {}
		local newtable = {}
		for num2 = 1, input, 1 do
			if num2 == 1 then table.insert(newtable, "Q")
			else table.insert(newtable, "X") end
			io.write(newtable[num2])
		end
		io.write("\n")
		wholeboard[num1] = newtable
		table.insert(queenpos, 1)
	end
	return queens(wholeboard,input,queenpos)
end
function queens(chessboard,input,queenpos)
	local num6, verticalAxis, boolean1 = 1, nil
	repeat
		if queenpos[num6] == input then boolean1 = queencounter(queenpos) end
		queenpos[num6] = queenpos[num6]+1
	until 
	return chessboard
end
repeat
	io.write("Please input an integer! Input EXIT to exit the script\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and (choice:find("%a+") or not choice:find("%d")) then io.write("Please input a valid number\n")
	elseif choice ~= "EXIT" and not choice:find("%a+") then chessboardbuilder(choice) end
until choice == "EXIT"