math.randomseed(os.time())

tLines = {}
function table.randomizer(tab)
	local tNewLines = {}
	local tKeys = {}
	for num1, num2 in pairs(tab) do
		table.insert(tKeys, num1)
	end
	for num3 = #tKeys, 2, -1 do
		local num4 = math.random(num3)
		tKeys[num3],tKeys[num4] = tKeys[num4],tKeys[num3]
	end
	for num5 = 1, #tab, 1 do
		table.insert(tNewLines, num5, tab[tKeys[num5]])
	end
	for num6 = 1, #tNewLines, 1 do print(tNewLines[num6]) end
	return tNewLines
end

for num0 in io.lines("output.txt") do
	table.insert(tLines, num0)
end
list = table.randomizer(tLines)
output = io.open("output.txt", "w+")
for num7 = 1, #list, 1 do
	output:write(list[num7], "\n")
end