function queencounter(queenpos)
	for _, num1 in ipairs(queenpos) do if num1 ~= #queenpos then return false end end
	return true
end
function QueenFinder(Row)
	for squarepositionint, Squares in ipairs(Row) do
		if Squares == "Q" then return squarepositionint end
	end
end
function BoardChecker(Chessboard)
	for rowpositionint, Row in ipairs(Chessboard) do
		if QueenChecker(Chessboard, rowpositionint, QueenFinder(Row)) == true then QueenCount+1 end
	end
	if QueenCount == Input then return 1
	else return 0 end
end
function QueenChecker(ChessBoard, Row, SquareInt)
	local DiagonalNumber, clear1, clear2 = 1
	for CurrentlySelectedRow = Row, 1, -1 do
		if Chessboard[CurrentlySelectedRow][SquareInt] == "Q" then clear1 = false; break
		elseif Chessboard[CurrentlySelectedRow][SquareInt+DiagonalNumber] == "Q" then clear1 = false; break
		elseif Chessboard[CurrentlySelectedRow][SquareInt-DiagonalNumber] == "Q" then clear1 = false; break
		else clear1 = true end 
		DiagonalNumber = DiagonalNumber+1
	end
	DiagonalNumber = 1
	for CurrentlySelectedRow = Row, #Chessboard, 1 do
		if Chessboard[CurrentlySelectedRow][SquareInt] == "Q" then clear2 = false; break
		elseif Chessboard[CurrentlySelectedRow][SquareInt+DiagonalNumber] == "Q" then clear2 = false; break
		elseif Chessboard[CurrentlySelectedRow][SquareInt-DiagonalNumber] == "Q" then clear2 = false; break
		else clear2 = true end
		DiagonalNumber = DiagonalNumber+1
	end
	if clear1 and clear2 then return true 
	else return false end
end
function AllQueensIterated(Chessboard,Input)
	local count = 0
	for _, Row in ipairs(Chessboard) do
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
	local count, retvalue, solutionsnumber, Squares, Row = 0, 0, 0
	repeat
		for rowpositionint, Row in ipairs(Chessboard) do
			retvalue = retvalue + BoardChecker(Chessboard, rowpositionint)
			if Row[Input] == "Q" then count = count + 1; Row[Input], Row[1] = Row[1], Row[Input]
			else break end
		end
		for squarepositionInt, Squares in ipairs(Chessboard[count+1]) do
			if Squares == "Q" then Chessboard[count+1][squarepositionInt] = Chessboard[count+1][squarepositionInt+1]; break end
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