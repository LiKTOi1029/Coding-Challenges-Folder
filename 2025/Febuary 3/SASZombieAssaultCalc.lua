DamagePerMag, DamagePerMinute, DamagePerSecond, AllAtOnce = "X", "O", "X", "O"
function Toggler(input)
	if input == "X" then input = "O" else input = "X" end
	return input
end
function WriteFile()
	local infile, outfile, result1, result2
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
	if not result1 and not result2 then result1, result2 = io.open(infile..".toml", "w"), io.open(outfile..".toml", "w"); result1:close(); result2:close(); result1, result2 = io.open(infile..".toml", "r"), io.open(outfile..".toml", "w+") elseif result1 and result2 then return result1, result2 end
	return result1, result2
end
function Settings()
	io.write(">1) DamagePerMag calculation ["..DamagePerMag.."]\n>2) DamagePerMinute calculation ["..DamagePerMinute.."]\n>3) DamagePerSecond calculation ["..DamagePerSecond.."]\n>4) Input values one by one ["..AllAtOnce.."]\n>5) Accept and return to menu\n")
	local choice = io.read("*l"):gsub("\n","")
	while choice ~= "4" do
		if choice == "1" then io.write(">DamagePerMag calculation toggle\n"); Toggler(DamagePerMag)
		elseif choice == "2" then io.write(">DamagePerMinute calculation toggle\n"); Toggler(DamagePerMinute)
		elseif choice == "3" then io.write(">DamagePerSecond calculation toggle\n"); Toggler(DamagePerSecond)
		elseif choice == "4" then io.write(">AllAtOnce toggle"); Toggler(AllAtOnce)
		else io.write(">Changes saved\n") end
	end
end
function BeginSetTable(choice)
	local CalcTable, damage, ammunition, rps, pierce, projectiles, reloadtime = {}
	if AllAtOnce == "X" then
	io.write(">Damage: "); damage = io.read("*l"):gsub("\n",""); table.insert(CalcTable, damage)
	io.write(">Ammunition: "); ammunition = io.read("*l"):gsub("\n",""); table.insert(CalcTable, ammunition)
	io.write(">RPS: "); rps = io.read("*l"):gsub("\n",""); table.insert(CalcTable, rps)
	io.write(">Pierce: "); pierce = io.read("*l"):gsub("\n",""); table.insert(CalcTable, pierce)
	io.write(">Projectiles Per Shot: "); projectiles = io.read("*l"):gsub("\n",""); table.insert(CalcTable, projectiles)
	io.write(">Reload Time: "); reloadtime = io.read("*l"):gsub("\n",""); table.insert(CalcTable, reloadtime)
	else end
repeat
	io.write("1) Settings\n2)Begin\n3)EXIT\n")
	local choice = io.read("*l"):gsub("\n","")
	if choice == "1" then Settings()
	elseif choice == "2" then BeginSetTable() end 
until choice == "3"