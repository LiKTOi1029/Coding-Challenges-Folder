function string.vreverse(input)
	local output = ""
	local tIteratedString = {}
	local tVowels = {"a","e","i","o","u","A","E","I","O","U",}
	local tVowelRecord = {}
	local num3 = 0
	for num3 = 1, #input, 1 do
		table.insert(tIteratedString, input:sub(num3,num3))
	end
	for num1, str in ipairs(tIteratedString) do
		for num2, vowel in ipairs(tVowels) do
			if str == vowel then table.insert(tVowelRecord,str) end
		end
	end
	for num5 = 1, #tVowelRecord/2, 1 do
		local num7 = #tVowelRecord+1-num5
		tVowelRecord[num5], tVowelRecord[num7] = tVowelRecord[num7], tVowelRecord[num5]
	end
	for num8, iRanOutOfNames in ipairs(tIteratedString) do
		for num9, iRanOutOfNames2 in ipairs(tVowels) do
			if iRanOutOfNames == iRanOutOfNames2 then table.remove(tIteratedString, num8); table.insert(tIteratedString, num8, tVowelRecord[1]); table.remove(tVowelRecord, 1) end
		end
		output = output..tIteratedString[num8]
	end
	return output
end
while true do
	io.write(">>Type something to vowel reverse! Type EXIT to exit.\n")
	local input = io.read("*l"):gsub("\n","")
	if input ~= "EXIT" then io.write(string.vreverse(input).."\n") else break end
end