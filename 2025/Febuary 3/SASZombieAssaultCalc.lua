DamagePerMag, DamagePerMinute, DamagePerSecond = false, true, false
function WriteFile()
	local infile, outfile, result1, result2
	while not infile do
		io.write("[FILER]: If no file is found it will create one manually\n[FILER]: Please give the name of the input file: ")
		infile = io.read("*l"):gsub("\n","")
		if infile == " " or not infile then print("Please input a valid name"); infile = nil end
	end
	while not outfile do
		io.write("[FILER]: If no file is found it will create one manually\n[FILER]: Please give the name of the output file: ")
		outfile = io.read("*l"):gsub("\n","")
		if outfile == " " or not outfile then print("Please input a valid name"); outfile = nil end
	end
	result1, result2 = io.open(infile..".toml", "r"), io.open(outfile..".toml", "r")
	if not result1 and not result2 then result1, result2 = io.open(infile..".toml", "w"), io.open(outfile..".toml", "w"); result1:close(); result2:close(); result1, result2 = io.open(infile..".toml", "r"), io.open(outfile..".toml", "w+") elseif result1 and result2 then return result1, result2 end
end
function Settings()

end
function Begin()

end
repeat
	io.write("1) Settings\n2)Begin\n3)EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
until choice == "3"