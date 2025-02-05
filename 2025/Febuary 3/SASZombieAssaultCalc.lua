DamagePerMag, DamagePerMinute, DamagePerSecond = "X", "O", "X"
function Toggler(input)
	if input == "X" then input = "O" else input = "X" end
	return input
end
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
	return result1, result2
end
function Settings()
	io.write("1) DamagePerMag calculation ["..DamagePerMag.."]\n2) DamagePerMinute calculation ["..DamagePerMinute.."]\n3) DamagePerSecond calculation ["..DamagePerSecond.."]\n4) Accept and return to menu\n")
	local choice = io.read("*l"):gsub("\n","")
	while choice ~= "4" do
		if choice == "1" then io.write("DamagePerMag calculation toggle")
	end
end
function Begin()

end
repeat
	io.write("1) Settings\n2)Begin\n3)EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
until choice == "3"