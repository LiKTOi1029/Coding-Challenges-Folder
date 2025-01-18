input = io.read("n")
for num0 = 1, input, 1 do
	for num1 = 1, num0, 1 do
		io.write("*")
	end
	io.write("\n")
end
print("Done after " .. os.clock() .. " seconds")