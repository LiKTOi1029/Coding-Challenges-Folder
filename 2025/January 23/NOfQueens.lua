function queencounter(queenpos)
	for _, num1 in ipairs(queenpos) do if num1 ~= #queenpos then return false end end
	return true
end
function BoardChecker(Chessboard)
	for unusedIntVariable, Row in ipairs(Chessboard) do
		if QueenChecker(Row) == true then QueenCount+1 end
	end
	if QueenCount == Input then return 1
	else return 0 end
end
function QueenChecker(Row, Chessboard)
	local clear1, clear2
	for CurrentlySelectedRow = Row, 1, -1 do
		if Chessboard[CurrentlySelectedRow][QP] == "Q" then clear1 = false
		elseif Chessboard[CurrentlySelectedRow][QP+DiagonalNumber] == "Q" then clear1 = false
		elseif Chessboard[CurrentlySelectedRow][QP-DiagonalNumber] == "Q" then clear1 = false
		else clear1 = true end 
	end

	for CurrentlySelectedRow = Row, #Chessboard, 1 do
		if Chessboard[CurrentlySelectedRow][QP] == "Q" then clear2 = false
		elseif Chessboard[CurrentlySelectedRow][QP+DiagonalNumber] == "Q" then clear2 = false
		elseif Chessboard[CurrentlySelectedRow][QP-DiagonalNumber] == "Q" then clear2 = false
		else clear2 = true end
	end
	if clear1 and clear2 then return true 
	else return false end
end
function AllQueensIterated(Chessboard,Input)
	local count = 0
	for unusedIntVariable, Row in ipairs(Chessboard) do
		if Row[Input] == "Q" then count = count+1 end
	end
	if count == Input then return true
	else return false end
end
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
	return PosIterator(wholeboard,input)
end
function PosIterator(Chessboard,Input)
	local count, retvalue, solutionsnumber = 0, 0, 0
	repeat
		for unusedIntVariable, Row in ipairs(Chessboard) do
			retvalue = retvalue + BoardChecker(Chessboard)
			if Row[Input] == "Q" then count = count + 1; Row[Input], Row[1] = Row[1], Row[Input]
			else break end
		end
		for positionInt, Squares in ipairs(Chessboard[count+1]) do
			if Squares == "Q" then Chessboard[count+1][positionInt] = Chessboard[count+1][positionInt+1]; break end
		end
	until true == AllQueensIterated(Chessboard,Input)
	return retValue
end
repeat
	io.write("Please input an integer! Input EXIT to exit the script\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and (choice:find("%a+") or not choice:find("%d")) then io.write("Please input a valid number\n")
	elseif choice ~= "EXIT" and not choice:find("%a+") then chessboardbuilder(choice) end
until choice == "EXIT"