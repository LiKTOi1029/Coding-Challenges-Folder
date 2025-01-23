function string.wc(input)
	local parser, count = "", 0
	for num1 = 1, input:len(), 1 do
		if input:sub(num1,num1) ~= " " then parser = parser..input:sub(num1,num1); print(parser)
		elseif input:sub(num1,num1) == " " or num1 == input:len() then parser = ""; count = count+1; print(count.." "..parser) end
	return count
	end
end
function MAIN()
	repeat
	local choice = io.read("*l"):gsub("\n","")
	if choice ~= "EXIT" then print(string.wc(tostring(choice))) end
	until choice == "EXIT"
end
MAIN()