newtable = {"Q","X","X"}
for num1 = 1, 5, 1 do
	for num2, item in ipairs(newtable) do
		io.write(item)
	end
	io.write("\n")
	newtable[1], newtable[3] = newtable[3], newtable[1]
end