function SettingsReader()
	local Settings = tinytoml.parse("settings.toml")
end
function Toggler(input)
	if input == "X" then input = "O" else input = "X" end
	return input
end
function WriteFile()
	local settingsfile, infile, outfile, result1, result2 = io.open(
	while not infile do
		io.write(">[FILER]: If no file is found it will create one manually\n[FILER]: Please give the name of the input file: ")
		infile = io.read("*l"):gsub("\n","")
		if infile == " " or not infile then print("Please input a valid name"); infile = nil end
	end
	while not outfile do
		io.write(">[FILER]: If no file is found it will create one manually\n[FILER]: Please give the name of the output file: ")
		outfile = io.read("*l"):gsub("\n","")
		if outfile == " " or not outfile then print("Please input a valid name"); outfile = nil end
	end
	result1, result2 = io.open(infile..".toml", "r"), io.open(outfile..".toml", "r")
	if not result1 and not result2 then result1, result2 = io.open(infile..".toml", "w"), io.open(outfile..".toml", "w"); result1:close(); result2:close(); elseif result1 and result2 then end
	print(">[FILER]: Please go to the settings and turn on file usage")
end
function Begin(CalcTable)
	
end
function BeginSetTableFiler()
	
end
function BeginSetTableTerminal(choice)
	local CalcTable, ParserString, damage, ammunition, rps, pierce, projectiles, reloadtime = {}, ""
	if AllAtOnce == "X" then
		io.write(">Damage: "); damage = io.read("*l"):gsub("\n",""); table.insert(CalcTable, damage)
		io.write(">Ammunition: "); ammunition = io.read("*l"):gsub("\n",""); table.insert(CalcTable, ammunition)
		io.write(">RPS: "); rps = io.read("*l"):gsub("\n",""); table.insert(CalcTable, rps)
		io.write(">Pierce: "); pierce = io.read("*l"):gsub("\n",""); table.insert(CalcTable, pierce)
		io.write(">Projectiles Per Shot: "); projectiles = io.read("*l"):gsub("\n",""); table.insert(CalcTable, projectiles)
		io.write(">Reload Time: "); reloadtime = io.read("*l"):gsub("\n",""); table.insert(CalcTable, reloadtime)
	return Begin(CalcTable)
	else
		io.write(">Damage, Ammunition, RPS, Pierce, Projectiles Per Shot, Reload Time:\n"); choice = io.read("*l"):gsub("\n","")
		for num1 = 1, choice:len(), 1 do
			ParserString = ParserString..choice:sub(num1,num1);
			if ParserString:sub(ParserString:len(),ParserString:len()) == " " then ParserString:gsub(" ",""); table.insert(CalcTable, tonumber(ParserString)); ParserString = "" end
		end
	return Begin(CalcTable)
	end
end
repeat
	io.write("1) Settings\n2)Begin\n3)EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice == "1" then Settings()
	elseif choice == "2" and FileUsage == "X" then print(">[OUTPUT]: "..BeginSetTableTerminal(choice)) 
	elseif choice == "2" and FileUsage == "O" then print(">[OUTPUT]: "..BeginSetTableFiler()) end 
until choice == "3"