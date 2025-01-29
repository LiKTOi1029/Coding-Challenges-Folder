function queencounter(queenpos)
	for _, num1 in ipairs(queenpos) do if num1 ~= #queenpos then return false end end
	return true
end
function BoardChecker(Chessboard)
	local Row, squarepositionint
	for rowpositionint, Row in ipairs(Chessboard) do
		for squareint, Squares in ipairs(Row) do
			print(tostring(squareint).." Debug 3")
			if Squares == "Q" then squarepositionint = squareint end
			if QueenChecker(Chessboard, rowpositionint, squarepositionint) == true then QueenCount=QueenCount+1 end
		end
	end
	if QueenCount == Input then return 1
	else return 0 end
end
function QueenChecker(Chessboard, Row, SquareInt)
	local DiagonalNumber, clear1, clear2 = 1
	for CurrentlySelectedRow = Row, 1, -1 do
		print(tostring(SquareInt).." "..tostring(Row).." "..tostring(Chessboard).." Debug 4")
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
function PosIterator(Chessboard,Input)
	print(tostring(Chessboard).." "..tostring(Input).." Debug 1")
	local count, retvalue, solutionsnumber, Squares, Row = 0, 0, 0
	repeat
		for rowpositionint, Row in ipairs(Chessboard) do
			print(tostring(rowpositionint).." Debug 2")
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
function ChessboardBuilder(input)
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
repeat
	io.write("Please input an integer! Input EXIT to exit the script\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" and (choice:find("%a+") or not choice:find("%d")) then io.write("Please input a valid number\n")
	elseif choice ~= "EXIT" and not choice:find("%a+") then ChessboardBuilder(choice) end
until choice == "EXIT"
--[[
KNOWN BUGS
1. The SquareInt variable in QueenChecker() keeps passing nil after NxN iterations have passed. I believe I know where the problem of the script may lie (PosIterator()) however more testing is required
2. 1 returns an endless loop of 1 without ending. I believe the script is halting somewhere in one of the resursions.
THINGS I WOULD PREFER TO CHANGE IN THE FUTURE
1. I would like to hopefully make the script slightly shorter so that I don't need to wait too long for all the recursions to finish. I'll have to come up with something to cut down on all these loops for sure.
--]]